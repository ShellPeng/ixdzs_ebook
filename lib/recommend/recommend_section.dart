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
}
