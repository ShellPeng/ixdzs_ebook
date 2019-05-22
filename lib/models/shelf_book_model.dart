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