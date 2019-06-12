import 'package:ixdzs_ebook/novel_detail/novel_detail_page.dart';
import '../app/application.dart';
import '../common/novel_cover.dart';
import '../models/recommend_model.dart';
import '../app/app_navigator.dart';

class RecommendNovelCell extends StatelessWidget {
  final RecNovelMdoel novelModel;
  RecommendNovelCell(this.novelModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, NovelDetail(novelModel.bid));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCover('https://img22.ixdzs.com/${novelModel.cover}',70,100),
            SizedBox(width: 15),
            Expanded(
              child: novelContent(),
            ),
          ]
        ),
      )
    );
  }

  Widget novelContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          novelModel.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        // SizedBox(height: 5),
        Row(children: <Widget>[
          Text(
              novelModel.author,
              style: TextStyle(fontSize: 13, color: AppColor.red),
            ),
          SizedBox(width: 5),
          Text(
              '|',
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
          SizedBox(width: 5),
          Text(
              novelModel.cat,
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
        ]),
        Text(
          novelModel.shortIntro,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: AppColor.gray,
          ),
        ),
        Row(children: <Widget>[
          Text(
              novelModel.zt,
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
          SizedBox(width: 5),
          Text(
              '|',
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
          SizedBox(width: 5),
          Text(
              '热度:${novelModel.followerCount}',
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
        ]),
        Text(
              novelModel.lastchapter,
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
      ],
    );
  }
}
