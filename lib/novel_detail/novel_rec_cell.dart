import 'package:ixdzs_ebook/novel_detail/novel_detail_page.dart';
import '../app/application.dart';
import '../common/novel_cover.dart';
import '../models/book_recommend.dart';
import '../app/app_navigator.dart';

class NovelRecCell extends StatelessWidget {
  final RecBookModel novel;
  NovelRecCell(this.novel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, NovelDetail(novel.bId));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCover('https://img22.ixdzs.com/${novel.cover}',70,100),
            SizedBox(width: 15),
            Expanded(
              child: novelContent(),
            ),
          ]
        ),
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(bottom: BorderSide(color: AppColor.paper,width: 1)),
          ),
      )
    );
  }

  Widget novelContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          novel.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
              novel.author,
              style: TextStyle(fontSize: 13, color: AppColor.red),
            ),
            SizedBox(height: 10),
        Text(
              novel.lastchapter,
              style: TextStyle(fontSize: 13, color: AppColor.gray),
            ),
      ],
    );
  }
}
