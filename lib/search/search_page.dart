import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:ixdzs_ebook/app/application.dart';
import 'ebook_sarchbar.dart';
import 'search_header.dart';
import '../common/section_title.dart';
import '../provide/booksearch_provide.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provide.value<BookSearchProvide>(context).reloadData();
    Provide.value<BookSearchProvide>(context).getSearchRecord();

    return Scaffold(
        appBar:
            AppBar(title: Text('搜索', style: TextStyle(color: Colors.white))),
        body: Provide<BookSearchProvide>(
          builder: (context, widget, provide) => EbookSearchBar(
                leading: Icon(Icons.search),
                decoration: InputDecoration.collapsed(hintText: "搜索"),
                onChanged: (keyWord) {
                  // print('搜索关键词：' + keyWord);
                  // provide.keyWords = keyWord;
                  provide.searchBooks(keyWord);
                },
                children: searchView(provide),
              ),
        ));
  }

  List<Widget> searchView(BookSearchProvide provide) {
    List<Widget> children = [];

    if (provide.keyWords == '') {
      children.add(SearchHeader(provide.hotWords, onTap: () {
        provide.reloadData();
      },bookTap: (){
        
      }));
      children.add(SectionTitle('搜索历史', '清空', onTap: () {
        provide.clearSearchRecord();
      }));
      for (var bookName in provide.searchList) {
        children.add(ListTile(
              leading: Icon(Icons.timer),
              title: Text(bookName),
              onTap: (){
                
              }
              ));
      }
    } else {
      if (provide.resultsModel.books == null ||
          provide.resultsModel.books.length == 0) {
        children.add(SearchHeader(provide.hotWords, onTap: () {
          provide.reloadData();
        }));
        children.add(SectionTitle('搜索历史', '清空', onTap: () {}));
      } else {
        for (var book in provide.resultsModel.books) {
          children.add(ListTile(
              leading: Icon(Icons.timer),
              title: Text(book.title == null ? '' : book.title),
              onTap: (){
                provide.saveSearchRecord(book.title);
              }
              ));
        }
      }
    }

    return children;
  }
}
