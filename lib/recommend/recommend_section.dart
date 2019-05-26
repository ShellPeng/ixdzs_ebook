import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'recommend_novel_cell.dart';
import '../models/recommend_model.dart';
import '../app/app_color.dart';
import '../common/section_title.dart';


class RecommendSection extends StatelessWidget {
  final RecNovelListModel novelListModel;
  RecommendSection(this.novelListModel);

  @override
  Widget build(BuildContext context) {

    List<Widget> childrenWidget = [
      SectionTitle(novelListModel.recommendType,'更多',onTap: (){

      })
    ];

    if (novelListModel.books != null){
      for (var novelModel in novelListModel.books){
      childrenWidget.add(RecommendNovelCell(novelModel));
      }
    }

    return SliverToBoxAdapter(
        child: Container(
          // margin: EdgeInsets.only(top: 10),
          color: AppColor.white,
          child: Column(
            children: childrenWidget
          ),
    ));
  }

  Widget sectionTitle(){
    return Container(
      color: AppColor.paper,
      padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
      child: Row(
        children: <Widget>[
          Image.asset('img/home_tip.png',color: Colors.red,),
          SizedBox(width: 10),
          Text(
            novelListModel.recommendType,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
