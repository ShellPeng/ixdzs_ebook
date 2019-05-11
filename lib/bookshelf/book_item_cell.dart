import 'package:flutter/material.dart';
import 'package:ixdzs_ebook/common/screen.dart';
import '../common/novel_cover.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../provide/bookshelf_provide.dart';
class BookItemCell extends StatelessWidget {
  final ShelfBookModel bookModel;
  BookItemCell(this.bookModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
              child: InkWell(
                child: Image(
                  image: CachedNetworkImageProvider(
                      'http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Color(0x22000000), blurRadius: 5)
              ])),
          SizedBox(
            width: 15,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(bookModel.bid,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Text('更新到：${bookModel.lastChapter}',
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
              Text('总共${bookModel.chaptersCount}章',
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
              Text(bookModel.updated,
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
