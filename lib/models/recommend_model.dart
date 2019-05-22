class RecNovelListModel {
  /**
   * ok : true
   * books : {
    "total":null,
    "books":[
        {
            "_id":"203463",
            "title":"重生影后：帝国首席，别过来！",
            "author":"棠不吝",
            "shortIntro":"【【第三届网络原创文学现实主义题材征文大赛】参赛作品】 “你睡了我，当然要对我负责。” ",
            "cover":"cd/9a/cd9ad6ee1e54d99d15495dcdc710df50.jpg",
            "cat":"其他类别",
            "followerCount":"72",
            "zt":"连载中",
            "updated":"2019-05-06T17:14:31+08:00",
            "lastchapter":"更新到:第1166章 番外·路包子（完）"
        },
        {
            "_id":"119521",
            "title":"九星",
            "author":"果味喵",
            "shortIntro":"如果有一天，你死了。 你的面前有两个选项： A，重生一次，B，穿越异界。 ",
            "cover":"25/5c/255c325789b411258534d9c44caf9a5c.jpg",
            "cat":"网游·竞技",
            "followerCount":"1205",
            "zt":"已完结",
            "updated":"2017-07-05T09:29:21+08:00",
            "lastchapter":"更新到:第596章 此心安处是吾乡！（大结局）"
        },
        {
            "_id":"148696",
            "title":"九天神皇",
            "author":"叶之凡",
            "shortIntro":"【玄幻至尊爽文】战神大陆，人们以修炼战气为主，强大的战将一拳就能打碎一座城门，恐怖的战王可以飞天遁地",
            "cover":"2b/60/2b60faee0b15f961c16d2e83f633962c.jpg",
            "cat":"玄幻·奇幻",
            "followerCount":"256",
            "zt":"连载中",
            "updated":"2019-05-21T10:35:02+08:00",
            "lastchapter":"更新到:第1383章 撑到最后"
        }
    ],
    "ok":true
}
   */

  bool ok;
  List<RecNovelMdoel> books;
  String recommendType = '';

  static RecNovelListModel fromMap(Map<String, dynamic> map) {
    RecNovelListModel listModel = new RecNovelListModel();
    listModel.ok = map['ok'];
    listModel.books = RecNovelMdoel.fromMapList(map['books']);
    return listModel;
  }

  static List<RecNovelListModel> fromMapList(dynamic mapList) {
    List<RecNovelListModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    if (list == null){
      list = [];
    }
    return list;
  }
}

class RecNovelMdoel {
  /**
   * _id : "203463"
   * title : "重生影后：帝国首席，别过来！"
   * author : "棠不吝"
   * shortIntro : "【【第三届网络原创文学现实主义题材征文大赛】参赛作品】      “你睡了我，当然要对我负责。”  "
   * cover : "cd/9a/cd9ad6ee1e54d99d15495dcdc710df50.jpg"
   * cat : "其他类别"
   * followerCount : "72"
   * zt : "连载中"
   * updated : "2019-05-06T17:14:31+08:00"
   * lastchapter : "更新到:第1166章 番外·路包子（完）"
   */

  String bid;
  String title;
  String author;
  String shortIntro;
  String cover;
  String cat;
  String followerCount;
  String zt;
  String updated;
  String lastchapter;
  

  static RecNovelMdoel fromMap(Map<String, dynamic> map) {
    RecNovelMdoel novelMdoel = new RecNovelMdoel();
    novelMdoel.bid = map['_id'];
    novelMdoel.title = map['title'];
    novelMdoel.author = map['author'];
    novelMdoel.shortIntro = map['shortIntro'];
    novelMdoel.cover = map['cover'];
    novelMdoel.cat = map['cat'];
    novelMdoel.followerCount = map['followerCount'];
    novelMdoel.zt = map['zt'];
    novelMdoel.updated = map['updated'];
    novelMdoel.lastchapter = map['lastchapter'];
    return novelMdoel;
  }

  static List<RecNovelMdoel> fromMapList(dynamic mapList) {
    List<RecNovelMdoel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    if (list == null){
      list = [];
    }
    return list;
  }
}
