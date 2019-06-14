import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ixdzs_ebook/app/app_color.dart';
import '../app/application.dart';
import '../models/book_detail_model.dart';
import 'package:provide/provide.dart';
import '../provide/bookshelf_provide.dart';

class NovelDetailToolbar extends StatelessWidget {
  final NovelDetailModel novel;
  NovelDetailToolbar(this.novel);

  // read() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
      decoration:
          BoxDecoration(color: Colors.white, boxShadow: Styles.borderShadow),
      height: 50 + Screen.bottomSafeHeight,
      child: Row(children: <Widget>[
        Expanded(
            child: GestureDetector(
          onTap: () {
            Provide.value<BookshelfProvide>(context).addNovelToShelf(json.encode(novel));
            print('加入书架');
          },
          child: Center(
            child: Text(
              '加书架',
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
          ),
        )),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // AppNavigator.pushReader(context, novel.firstArticleId);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  '开始阅读',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            // AppNavigator.pushReader(context, novel.firstArticleId);
          },
          child: Center(
            child: Text(
              '下载',
              style: TextStyle(fontSize: 16, color: Colors.lightBlue),
            ),
          ),
        )),
      ]),
    );
  }
}
