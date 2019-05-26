import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import '../common/screen.dart';

class EbookSearchBar extends StatelessWidget {
  EbookSearchBar({
    this.body,
    this.drawer,
    this.trailing,
    this.leading,
    this.endDrawer,
    this.controller,
    this.onChanged,
    this.title,
    this.decoration,
    this.onTap,
    this.sectionOne,
    this.sectionTwo,
    @required List<Widget> children,
  }) : _childDelagate = SliverChildListDelegate(
          children,
        );

  EbookSearchBar.builder({
    this.body,
    this.drawer,
    this.endDrawer,
    this.trailing,
    this.leading,
    this.controller,
    this.onChanged,
    this.title,
    this.onTap,
    this.decoration,
    this.sectionOne,
    this.sectionTwo,
    @required IndexedWidgetBuilder itemBuilder,
    @required int itemCount,
  }) : _childDelagate = SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
        );

  final Widget leading, trailing, body, drawer, endDrawer;

  final SliverChildDelegate _childDelagate;

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  final InputDecoration decoration;

  final VoidCallback onTap;

  /// Override the search field
  final Widget title;

  final Widget sectionOne;

  final Widget sectionTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      endDrawer: endDrawer,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: true,
              floating: false,
              title: Text('搜索',style:TextStyle(color: Colors.white)),
              expandedHeight:Screen.topSafeHeight+20,
              flexibleSpace: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverFloatingBar(
                    leading: leading,
                    floating: false,
                    title: TextField(
                      controller: controller,
                      decoration: decoration ??
                          InputDecoration.collapsed(
                            hintText: "Search...",
                          ),
                      autofocus: false,
                      onChanged: onChanged,
                      onTap: onTap,
                    ),
                    trailing: trailing,
                    pinned: true,
                  ),
                ],
              )),
          sectionOne??SliverToBoxAdapter(),
          SliverList(
            delegate: _childDelagate,
          ),
          sectionTwo??SliverToBoxAdapter()
        ],
      ),
    );
  }
}
