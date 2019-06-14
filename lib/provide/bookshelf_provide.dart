import 'dart:convert';

import 'package:ixdzs_ebook/app/application.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/application.dart';
import '../models/shelf_book_model.dart';
import '../models/book_detail_model.dart';


class BookshelfProvide with ChangeNotifier{
  List<NovelDetailModel> _shelfBookList = [];
  List<NovelDetailModel> get shelfBookList => _shelfBookList;

  reloadData() async {
    // _shelfBookList.clear();
    _shelfBookList = await _updateBookList();
  
    notifyListeners();
  }

  addNovelToShelf(String book) async {
    preferences = await SharedPreferences.getInstance();
    var bookArray = preferences.getStringList('BookShelf');
    if (bookArray == null){
      bookArray = [book];
    }else{
      bookArray.add(book);
    }
    preferences.setStringList('BookShelf', bookArray);
  }

Future<List<NovelDetailModel>> _updateBookList() async{
    preferences = await SharedPreferences.getInstance();
    var bookArray = preferences.getStringList('BookShelf');
    if (bookArray == null){
      preferences.setStringList('BookShelf', bookArray);
    }
    var bids = ''; 
    bookArray.forEach((String book) {
      if (bids == ''){
        bids = NovelDetailModel.fromJson(json.decode(book)).bId;
      }else{
        bids = bids+','+NovelDetailModel.fromJson(json.decode(book)).bId;
      }
    });

    var response = await request(EbookApi.Update,params: {'id': bids});
    var newBooks = NovelDetailModel.fromMapList(response.data);
    for (var index = 0;index<newBooks.length;index++){
      var oldBook = NovelDetailModel.fromJson(json.decode(bookArray[index]));
      newBooks[index].title = oldBook.title;
      newBooks[index].cover = oldBook.cover;
    }
    print(newBooks.first.title);
    print(newBooks.first.cover);
    return newBooks;
  }
}