import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const double _kPanelHeaderCollapsedHeight = 44.0;
const double _kPanelHeaderExpandedHeight = 44.0;

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt
        && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}

/// Signature for the callback that's called when an [PPExpansionPanel] is
/// expanded or collapsed.
///
/// The position of the panel within an [PPExpansionPanelList] is given by
/// [panelIndex].
typedef PPExpansionPanelCallback = void Function(int panelIndex, bool isExpanded);

/// Signature for the callback that's called when the header of the
/// [PPExpansionPanel] needs to rebuild.
typedef PPExpansionPanelHeaderBuilder = Widget Function(BuildContext context, bool isExpanded);

/// A material expansion panel. It has a header and a body and can be either
/// expanded or collapsed. The body of the panel is only visible when it is
/// expanded.
///
/// Expansion panels are only intended to be used as children for
/// [PPExpansionPanelList].
///
/// See [PPExpansionPanelList] for a sample implementation.
///
/// See also:
///
///  * [PPExpansionPanelList]
///  * <https://material.io/design/components/lists.html#types>
class PPExpansionPanel {
  /// Creates an expansion panel to be used as a child for [PPExpansionPanelList].
  /// See [PPExpansionPanelList] for an example on how to use this widget.
  ///
  /// The [headerBuilder], [body], and [isExpanded] arguments must not be null.
  PPExpansionPanel({
    @required this.headerBuilder,
    @required this.body,
    this.isExpanded = false,
    this.canTapOnHeader = false,
  }) : assert(headerBuilder != null),
       assert(body != null),
       assert(isExpanded != null),
       assert(canTapOnHeader != null);

  /// The widget builder that builds the expansion panels' header.
  final PPExpansionPanelHeaderBuilder headerBuilder;

  /// The body of the expansion panel that's displayed below the header.
  ///
  /// This widget is visible only when the panel is expanded.
  final Widget body;

  /// Whether the panel is expanded.
  ///
  /// Defaults to false.
  final bool isExpanded;

  /// Whether tapping on the panel's header will expand/collapse it.
  ///
  /// Defaults to false.
  final bool canTapOnHeader;

}

/// An expansion panel that allows for radio-like functionality.
/// This means that at any given time, at most, one [PPExpansionPanelRadio]
/// can remain expanded.
///
/// A unique identifier [value] must be assigned to each panel.
/// This identifier allows the [PPExpansionPanelList] to determine
/// which [PPExpansionPanelRadio] instance should be expanded.
///
/// See [PPExpansionPanelList.radio] for a sample implementation.
class PPExpansionPanelRadio extends PPExpansionPanel {

  /// An expansion panel that allows for radio functionality.
  ///
  /// A unique [value] must be passed into the constructor. The
  /// [headerBuilder], [body], [value] must not be null.
  PPExpansionPanelRadio({
    @required this.value,
    @required PPExpansionPanelHeaderBuilder headerBuilder,
    @required Widget body,
    bool canTapOnHeader = false,
  }) : assert(value != null),
      super(
        body: body,
        headerBuilder: headerBuilder,
        canTapOnHeader: canTapOnHeader,
      );

  /// The value that uniquely identifies a radio panel so that the currently
  /// selected radio panel can be identified.
  final Object value;
}


class PPExpansionPanelList extends StatefulWidget {
  /// Creates an expansion panel list widget. The [expansionCallback] is
  /// triggered when an expansion panel expand/collapse button is pushed.
  ///
  /// The [children] and [animationDuration] arguments must not be null.
  const PPExpansionPanelList({
    Key key,
    this.children = const <PPExpansionPanel>[],
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
  }) : assert(children != null),
       assert(animationDuration != null),
       _allowOnlyOnePanelOpen = false,
       initialOpenPanelValue = null,
       super(key: key);

  const PPExpansionPanelList.radio({
    Key key,
    this.children = const <PPExpansionPanelRadio>[],
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
    this.initialOpenPanelValue,
  }) : assert(children != null),
       assert(animationDuration != null),
       _allowOnlyOnePanelOpen = true,
       super(key: key);

  /// The children of the expansion panel list. They are laid out in a similar
  /// fashion to [ListBody].
  final List<PPExpansionPanel> children;

  /// The callback that gets called whenever one of the expand/collapse buttons
  /// is pressed. The arguments passed to the callback are the index of the
  /// pressed panel and whether the panel is currently expanded or not.
  ///
  /// If PPExpansionPanelList.radio is used, the callback may be called a
  /// second time if a different panel was previously open. The arguments
  /// passed to the second callback are the index of the panel that will close
  /// and false, marking that it will be closed.
  ///
  /// For PPExpansionPanelList, the callback needs to setState when it's notified
  /// about the closing/opening panel. On the other hand, the callback for
  /// PPExpansionPanelList.radio is simply meant to inform the parent widget of
  /// changes, as the radio panels' open/close states are managed internally.
  ///
  /// This callback is useful in order to keep track of the expanded/collapsed
  /// panels in a parent widget that may need to react to these changes.
  final PPExpansionPanelCallback expansionCallback;

  /// The duration of the expansion animation.
  final Duration animationDuration;

  // Whether multiple panels can be open simultaneously
  final bool _allowOnlyOnePanelOpen;

  /// The value of the panel that initially begins open. (This value is
  /// only used when initializing with the [PPExpansionPanelList.radio]
  /// constructor.)
  final Object initialOpenPanelValue;

  @override
  State<StatefulWidget> createState() => _PPExpansionPanelListState();
}

class _PPExpansionPanelListState extends State<PPExpansionPanelList> {
  PPExpansionPanelRadio _currentOpenPanel;

  @override
  void initState() {
    super.initState();
    if (widget._allowOnlyOnePanelOpen) {
      assert(_allIdentifiersUnique(), 'All PPExpansionPanelRadio identifier values must be unique.');
      if (widget.initialOpenPanelValue != null) {
        _currentOpenPanel = searchPanelByValue(widget.children, widget.initialOpenPanelValue);
      }
    }
  }

  @override
  void didUpdateWidget(PPExpansionPanelList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._allowOnlyOnePanelOpen) {
      assert(_allIdentifiersUnique(), 'All PPExpansionPanelRadio identifier values must be unique.');
      // If the previous widget was non-radio PPExpansionPanelList, initialize the
      // open panel to widget.initialOpenPanelValue
      if (!oldWidget._allowOnlyOnePanelOpen) {
        _currentOpenPanel = searchPanelByValue(widget.children, widget.initialOpenPanelValue);
      }
    } else {
      _currentOpenPanel = null;
    }
  }

  bool _allIdentifiersUnique() {
    final Map<Object, bool> identifierMap = <Object, bool>{};
    for (PPExpansionPanelRadio child in widget.children) {
      identifierMap[child.value] = true;
    }
    return identifierMap.length == widget.children.length;
  }

  bool _isChildExpanded(int index) {
    if (widget._allowOnlyOnePanelOpen) {
      final PPExpansionPanelRadio radioWidget = widget.children[index];
      return _currentOpenPanel?.value == radioWidget.value;
    }
    return widget.children[index].isExpanded;
  }

  void _handlePressed(bool isExpanded, int index) {
    if (widget.expansionCallback != null)
      widget.expansionCallback(index, isExpanded);

    if (widget._allowOnlyOnePanelOpen) {
      final PPExpansionPanelRadio pressedChild = widget.children[index];

      // If another PPExpansionPanelRadio was already open, apply its
      // expansionCallback (if any) to false, because it's closing.
      for (int childIndex = 0; childIndex < widget.children.length; childIndex += 1) {
        final PPExpansionPanelRadio child = widget.children[childIndex];
        if (widget.expansionCallback != null &&
            childIndex != index &&
            child.value == _currentOpenPanel?.value)
          widget.expansionCallback(childIndex, false);
      }

      setState(() {
        _currentOpenPanel = isExpanded ? null : pressedChild;
      });
    }
  }

  PPExpansionPanelRadio searchPanelByValue(List<PPExpansionPanelRadio> panels, Object value)  {
    for (PPExpansionPanelRadio panel in panels) {
      if (panel.value == value)
        return panel;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];
    const EdgeInsets kExpandedEdgeInsets = EdgeInsets.symmetric(
      vertical: _kPanelHeaderExpandedHeight - _kPanelHeaderCollapsedHeight
    );

    for (int index = 0; index < widget.children.length; index += 1) {
      if (_isChildExpanded(index) && index != 0 && !_isChildExpanded(index - 1))
        items.add(MaterialGap(key: _SaltedKey<BuildContext, int>(context, index * 2 - 1)));

      final PPExpansionPanel child = widget.children[index];
      final Widget headerWidget = child.headerBuilder(
        context,
        _isChildExpanded(index),
      );
      final Row header = Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: widget.animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: _isChildExpanded(index) ? kExpandedEdgeInsets : EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: _kPanelHeaderCollapsedHeight),
                child: headerWidget,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: ExpandIcon(
              isExpanded: _isChildExpanded(index),
              padding: const EdgeInsets.all(16.0),
              onPressed: !child.canTapOnHeader
                ? (bool isExpanded) => _handlePressed(isExpanded, index)
                : null,
            ),
          ),
        ],
      );

      items.add(
        MaterialSlice(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          child: Column(
            children: <Widget>[
              MergeSemantics(
                child: child.canTapOnHeader
                  ? InkWell(
                  onTap: () => _handlePressed(_isChildExpanded(index), index),
                  child: header,
                )
                  : header,
              ),
              AnimatedCrossFade(
                firstChild: Container(height: 0.0),
                secondChild: child.body,
                firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState: _isChildExpanded(index) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: widget.animationDuration,
              ),
            ],
          ),
        ),
      );

      if (_isChildExpanded(index) && index != widget.children.length - 1)
        items.add(MaterialGap(key: _SaltedKey<BuildContext, int>(context, index * 2 + 1)));
    }

    return MergeableMaterial(
      hasDividers: true,
      children: items,
    );
  }
}
