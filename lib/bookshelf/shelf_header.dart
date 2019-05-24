import 'package:flutter/material.dart';
import '../app/application.dart';
import 'shelf_cloud.dart';
import '../common/novel_cover.dart';

class ShelfHeader extends StatefulWidget {
  // final Novel novel;

  ShelfHeader();

  @override
  _ShelfHeaderState createState() => _ShelfHeaderState();
}

class _ShelfHeaderState extends State<ShelfHeader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var bgHeight = width / 0.9;
    var height = Screen.topSafeHeight + 250;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: height - bgHeight,
            child: Image.asset(
              'img/bookshelf_bg.png',
              fit: BoxFit.cover,
              width: width,
              height: bgHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: ShelfCloud(
              animation: animation,
              width: width,
            ),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    // Novel novel = this.widget.novel;

    var width = Screen.width;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          // AppNavigator.pushNovelDetail(context, novel);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: NovelCover('https://img22.aixdzs.com/37/8e/378e3be4bfec908983a88f203926108d.jpg', 120, 160),
              decoration: BoxDecoration(boxShadow: Styles.borderShadow),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Text("三体", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text('读至0.2%     继续阅读 ', style: TextStyle(fontSize: 14, color: AppColor.paper)),
                      Image.asset('img/bookshelf_continue_read.png'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}