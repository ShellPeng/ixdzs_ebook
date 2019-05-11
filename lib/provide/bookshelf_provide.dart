import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/application.dart';
import 'package:flutter/foundation.dart';
import 'package:ixdzs_ebook/app/application.dart';


class BookshelfProvide with ChangeNotifier{
  List<ShelfBookModel> _shelfBookList = [];
  List<ShelfBookModel> get shelfBookList => _shelfBookList;

  void reloadData() async {
    // _shelfBookList.clear();
    _shelfBookList = await _updateBookList();
  
    notifyListeners();
  }

Future<List<ShelfBookModel>> _updateBookList() async{
    preferences = await SharedPreferences.getInstance();
    preferences.setStringList('bids', ['151926','154223','200077','168481','195630','168708']);
    var bidArray = preferences.getStringList('bids').toList(); 
    print(bidArray); 
    var bids = ''; 
    bidArray.forEach((String bid) {
      if (bids == ''){
        bids = bid;
      }else{
        bids = bids+','+bid;
      }
    });
    print(bids);
    var response = await request(EbookApi.update,params: {'id': bids});
    return ShelfBookModel.fromMapList(response.data); 
  }
}

 class ShelfBookModel {

  /**
   * _id : "154223"
   * author : "六道沉沦"
   * referenceSource : "default"
   * updated : "2019-05-10T17:59:31+08:00"
   * chaptersCount : "2724"
   * lastChapter : "第二十六章 空间秘地"
   * allowMonthly : false
   */

  String bid;
  String author;
  String referenceSource;
  String updated;
  String chaptersCount;
  String lastChapter;
  bool allowMonthly;

  static ShelfBookModel fromMap(Map<String, dynamic> map) {
    ShelfBookModel bookModel = new ShelfBookModel();
    bookModel.bid = map['_id']; 
    bookModel.author = map['author'];
    bookModel.referenceSource = map['referenceSource'];
    bookModel.updated = map['updated'];
    bookModel.chaptersCount = map['chaptersCount'];
    bookModel.lastChapter = map['lastChapter'];
    bookModel.allowMonthly = map['allowMonthly'];
    return bookModel;
  }

  static List<ShelfBookModel> fromMapList(dynamic mapList) {
    List<ShelfBookModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    for (var model in list) {
      if (model.bid == null){
        list.remove(model);
      }
    }
    return list;
  }

}