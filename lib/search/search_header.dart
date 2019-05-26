import 'package:flutter/material.dart';
import '../app/application.dart';
import 'dart:math';
import '../common/section_title.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key key}) : super(key: key);
  // final HotAuthorModel hotAuthorsModel;
  // RecommendAuthors(this.hotAuthorsModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenChips = [];
    var books = [
      "我的专属梦境游戏",
      "哈利波特之学霸传奇",
      "进化之眼",
      "转生眼中的火影世界",
      "汉乡",
      "老公不卸任",
      "大叔的心尖宝贝",
      "超神机械师",
      "凡人修仙之仙界篇",
      "史上第一混乱",
      "雪中悍刀行"
    ];
    // if (hotAuthorsModel.authors != null) {
    for (var author in books) {
      childrenChips.add(Container(
        height: 30,
        child: ActionChip(
          label:
              Text(author, style: TextStyle(color: Colors.white, fontSize: 13)),
          // labelPadding: EdgeInsets.symmetric(vertical: -2),
          backgroundColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onPressed: () {}),
        // child: GestureDetector(
        //   child: Text(author,style:TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        // ),
      )
          );
    }
    // }

    return Container(
        child: Column(
      children: <Widget>[
        SectionTitle('大家都在搜', '换一批',onTap: (){}),
        Container(
            width: Screen.width-20,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 5,
              runSpacing: 3,
              children: childrenChips,
            ))
      ],
    ));
  }

  Widget sectionTitle() {
    return Container(
      color: AppColor.paper,
      padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
      child: Row(
        children: <Widget>[
          Image.asset(
            'img/home_tip.png',
            color: Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            '大家都在搜',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Container(),),
          Container(
            height: 24,
            child: FlatButton.icon(
              icon: Icon(Icons.refresh,color: AppColor.gray,),
              label: Text('换一批',),
              color: AppColor.paper,
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
