import 'package:flutter/material.dart';
import 'package:ixdzs_ebook/app/application.dart';
import 'novel_detail_header.dart';
import 'novel_detail_toolbar.dart';
import 'novel_summary.dart';
import 'novel_rec_section.dart';

import '../provide/bookdetail_provide.dart';
import 'package:provide/provide.dart';


class NovelDetail extends StatelessWidget {
  final String bid;
  const NovelDetail(this.bid,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provide.value<BookDetailProvide>(context).reloadData(bid);

    return Scaffold(
      appBar: AppBar(title: Text('书籍详情',style: TextStyle(color: Colors.white),),iconTheme: IconThemeData(color: Colors.white,)),
      body: Provide<BookDetailProvide>(builder: (context,widget,provide)=> Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: <Widget>[
                    NovelDetailHeader(provide.detailModel),
                    NovelSummary(provide.detailModel.longIntro, provide.isUnfold, (){
                      provide.changeUnfoldState();
                    }),
                    NovelRecSection(provide.recListModel)
                  ],
                ),
              ),
              NovelDetailToolbar(),
            ],
          ),
          // buildNavigationBar(),
        ],
      ),) 
    );
  }


}