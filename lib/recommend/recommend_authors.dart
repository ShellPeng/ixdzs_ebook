import 'package:flutter/material.dart';
import '../models/hotauthors_model.dart';
import '../app/app_color.dart';
import 'dart:math';

class RecommendAuthors extends StatelessWidget {
  final HotAuthorModel hotAuthorsModel;
  RecommendAuthors(this.hotAuthorsModel, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenChips = [];
    if (hotAuthorsModel.authors != null) {
      for (var author in hotAuthorsModel.authors) {
        childrenChips.add(ActionChip(
          label: Text(author, style: TextStyle(color: Colors.white,fontSize: 13)),
          labelPadding: EdgeInsets.symmetric(vertical: -2), 
          backgroundColor: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onPressed: (){}
        ));
      }
    }

    return SliverToBoxAdapter(
      child: Container(
        child: Column(
      children: <Widget>[
        sectionTitle(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
          child:Wrap(
          spacing: 5,
          runSpacing: -10,
          // alignment: WrapAlignment.center,
          children: childrenChips,
        )
        )
      ],
    ))
    );
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
            '热门作者',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
