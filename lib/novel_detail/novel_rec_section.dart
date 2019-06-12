import 'package:flutter/material.dart';
import '../models/book_recommend.dart';
import '../app/app_color.dart';
import '../common/section_title.dart';
import 'novel_rec_cell.dart';


class NovelRecSection extends StatelessWidget {
  final DetailRecListModel novelListModel;
  NovelRecSection(this.novelListModel);

  @override
  Widget build(BuildContext context) {

    List<Widget> childrenWidget = [
      SectionTitle('猜你喜欢','更多',onTap: (){

      })
    ];

    if (novelListModel.booklists != null){
      for (var novelModel in novelListModel.booklists){
      childrenWidget.add(NovelRecCell(novelModel));
      }
    }

    return Container(
          color: AppColor.white,
          child: Column(
            children: childrenWidget
          ),
    );
  }
}
