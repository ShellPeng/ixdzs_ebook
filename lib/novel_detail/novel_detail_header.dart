import 'package:flutter/material.dart';
import '../common/novel_cover.dart';
import '../app/application.dart';
import '../models/book_detail_model.dart';

class NovelDetailHeader extends StatelessWidget {
  final NovelDetailModel novel;
  const NovelDetailHeader(this.novel,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(top:BorderSide(color: AppColor.paper,width: 1),bottom: BorderSide(color: AppColor.paper,width: 1)),
          ), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NovelCover(
              'https://img22.ixdzs.com/${novel.cover}',
              100,
              133),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  novel.title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(
                    novel.author,
                    style: TextStyle(fontSize: 13, color: AppColor.red),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 13, color: AppColor.gray),
                  ),
                  SizedBox(width: 5),
                  Expanded(child:Text(
                    novel.cat,
                    style: TextStyle(fontSize: 13, color: AppColor.gray),
                  )),
                ]),
                SizedBox(height: 5),
                Text(
                  '字数：${novel.wordCount}字',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.gray,
                  ),
                ),
                SizedBox(height: 5),
                Row(children: <Widget>[
                  Text(
                    '连载中',
                    style: TextStyle(fontSize: 13, color: AppColor.gray),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 13, color: AppColor.gray),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '热度:${'19999'}',
                    style: TextStyle(fontSize: 13, color: AppColor.gray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
                SizedBox(height: 5),
                Text(
                  '最新章节：${novel.lastChapter}',
                  style: TextStyle(fontSize: 13, color: AppColor.gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
