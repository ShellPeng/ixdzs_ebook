import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/shelf_book_model.dart';

class BookItemCell extends StatelessWidget {
  final ShelfBookModel bookModel;
  BookItemCell(this.bookModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10), 
      height: 230,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(

              child: InkWell(
                child: Image(
                  image: CachedNetworkImageProvider(
                      'https://img22.aixdzs.com/nopic2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Color(0x22000000), blurRadius: 5)
              ])),
          SizedBox(
            width: 15,
          ),
          Expanded(child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(bookModel.bId,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Text('更新到：${bookModel.lastChapter}',
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
              Text('总共${bookModel.chaptersCount}章',
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
              Text(DateTime.parse(bookModel.updated).toString(),
                  style: TextStyle(fontSize: 12,color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ))
          
        ],
      ),
    );
  }
}
