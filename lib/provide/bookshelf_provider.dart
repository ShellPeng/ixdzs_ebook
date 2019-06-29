import 'dart:convert';

import 'package:ixdzs_ebook/app/application.dart';
import '../app/application.dart';
import '../models/book_detail_model.dart';


class BookshelfProvider with ChangeNotifier{
  List<NovelDetailModel> _shelfBookList = [];
  List<NovelDetailModel> get shelfBookList => _shelfBookList;

  Future reloadData() async {
    _shelfBookList = await _updateBookList();
  
    notifyListeners();
  }

  addNovelToShelf(String book) async {
    
    List<String> bookArray = SpUtil.getStringList('BookShelf');
    if (bookArray.isEmpty){
      bookArray = [book];
    }else{
      bookArray.add(book);
    }
    if(await SpUtil.putStringList('BookShelf', bookArray)){
          print(SpUtil.getStringList('BookShelf'));
    }
  }

Future<List<NovelDetailModel>> _updateBookList() async{
    
    List<String> bookArray = SpUtil.getStringList('BookShelf');
    print(bookArray);
    if (bookArray==null){
      bookArray = [];
    }
    var bids = '';
    if (bookArray.isNotEmpty) 
        bookArray.forEach((String book) {
          if (bids == ''){
            bids = NovelDetailModel.fromJson(json.decode(book)).bId;
          }else{
            bids = bids+','+NovelDetailModel.fromJson(json.decode(book)).bId;
          }
        });
    var response = await request(EbookApi.Update,params: {'id': bids});
    List<NovelDetailModel> newBooks = NovelDetailModel.fromMapList(response.data);
    for (var index = 0;index<newBooks.length;index++){
      var oldBook = NovelDetailModel.fromJson(json.decode(bookArray[index]));
      newBooks[index].title = oldBook.title;
      newBooks[index].cover = oldBook.cover;
    }
    return newBooks;
  }
}