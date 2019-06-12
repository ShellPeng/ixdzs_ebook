import 'package:flutter/material.dart';
import '../novel_detail/novel_detail_page.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  static pushNovelDetail(BuildContext context, String bid) {
    AppNavigator.push(context, NovelDetail(bid));
  }
}