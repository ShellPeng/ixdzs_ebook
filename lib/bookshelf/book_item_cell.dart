import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/book_detail_model.dart';
import '../app/app_color.dart';

class BookItemCell extends StatelessWidget {
  final NovelDetailModel novel;
  BookItemCell(this.novel);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Image(
                image: CachedNetworkImageProvider(
                    'https://img22.ixdzs.com/${novel.cover}'),
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Color(0x22000000), blurRadius: 5)
              ])),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              // SizedBox(height: 10),
              Text(novel.title,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Text('更新到：${novel.lastChapter}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Text('总共${novel.chaptersCount}章',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Text(DateTime.parse(novel.updated).toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          )),
        ],
      ),
    ));
  }
}
