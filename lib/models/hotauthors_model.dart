class HotAuthorModel {

  /**
   * ok : true
   * authors : ["古龙","唐家三少","耳根","温瑞安","萧逸","辰东","于晴","梁羽生","殷谦","天蚕土豆","我吃西红柿","李凉","猫腻","金庸","司马紫烟","黄易","梦入神机","卧龙生","风凌天下","徐奇峰","无罪","不详","流浪的蛤蟆","鹅是老五","饶雪漫","骷髅精灵","烽火戏诸侯","月关","烟雨江南","秋梦痕"]
   */

  bool ok;
  List<String> authors;

  static HotAuthorModel fromMap(Map<String, dynamic> map) {
    HotAuthorModel hotAuthorModel = new HotAuthorModel();
    hotAuthorModel.ok = map['ok'];

    List<dynamic> dynamicList0 = map['authors'];
    hotAuthorModel.authors = new List();
    hotAuthorModel.authors.addAll(dynamicList0.map((o) => o.toString()));

    return hotAuthorModel;
  }

  static List<HotAuthorModel> fromMapList(dynamic mapList) {
    List<HotAuthorModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
