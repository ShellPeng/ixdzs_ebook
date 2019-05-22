import 'package:flutter/material.dart';
import '../app/application.dart';

class RecommendHeader extends StatelessWidget {
  const RecommendHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              categoryItem('img/menu_category.png', '分类'),
              categoryItem('img/menu_publish.png', '最新'),
              categoryItem('img/menu_rank.png', '排行'),
              categoryItem('img/menu_complete.png', '完结')
            ],
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(top:BorderSide(color: AppColor.paper,width: 1),bottom: BorderSide(color: AppColor.paper,width: 1)),
          ),
          ),
          
    );
  }

  Widget categoryItem(String iconName, String itemTitle) {
    return Column(children: <Widget>[
      Image.asset(iconName),
      // SizedBox(height: 5),
      Text(itemTitle, style: TextStyle(fontSize: 12, color: AppColor.gray)),
    ]);
  }
}
