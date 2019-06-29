import 'package:flutter/material.dart';
import 'package:ixdzs_ebook/app/application.dart';
import 'package:ixdzs_ebook/provide/bookdetail_provider.dart';
import 'novel_detail_header.dart';
import 'novel_detail_toolbar.dart';
import 'novel_summary.dart';
import 'novel_rec_section.dart';

class NovelDetail extends StatelessWidget {
  final String bid;
  NovelDetail(this.bid, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              builder: (_) => BookDetailProvider()..reloadData(bid))
        ],
        child: Consumer<BookDetailProvider>(builder: (_, bookProvider, widget) {
          return Scaffold(
              appBar: AppBar(
                  title: Text(
                    '书籍详情',
                    style: TextStyle(color: Colors.white),
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
              body: (bookProvider.detailModel == null)?null:Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          // padding: EdgeInsets.only(top: 0),
                          children: <Widget>[
                            NovelDetailHeader(bookProvider.detailModel),
                            NovelSummary(bookProvider.detailModel.longIntro,
                                bookProvider.isUnfold, () {}),
                            NovelRecSection(bookProvider.recListModel)
                          ],
                        ),
                      ),
                      NovelDetailToolbar(bookProvider.detailModel),
                    ],
                  ),
                ],
              )
              );
        }));
  }
}
