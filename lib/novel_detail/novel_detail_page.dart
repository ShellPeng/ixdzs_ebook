import 'package:flutter/material.dart';
import 'package:ixdzs_ebook/app/application.dart';
import 'novel_detail_header.dart';
import 'novel_detail_toolbar.dart';
import 'novel_summary.dart';
import 'novel_rec_section.dart';
import '../models/book_recommend.dart';
import '../models/book_detail_model.dart';

class NovelDetail extends StatefulWidget {
  final String bid;
  NovelDetail(this.bid, {Key key}) : super(key: key);

  _NovelDetailState createState() => _NovelDetailState();
}

class _NovelDetailState extends State<NovelDetail> {
  bool _isUnfold = false;
  NovelDetailModel _detailModel = NovelDetailModel()
    ..title = ''
    ..author = ''
    ..cat = ''
    ..longIntro = '';
  DetailRecListModel _recListModel = DetailRecListModel();

  @override
  void initState() { 
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      NovelDetailModel detailModel = await _getNovelDetail();
      DetailRecListModel recListModel = await _getRecNevelList();

      setState(() {
        _detailModel = detailModel;
        _recListModel = recListModel;
        print(_recListModel);
      });
    } catch (e) {}
  }

  Future<NovelDetailModel> _getNovelDetail() async {
    var response = await request(EbookApi.BookDetail(this.widget.bid));
    return NovelDetailModel.fromJson(response.data);
  }

  Future<DetailRecListModel> _getRecNevelList() async {
    var response = await request(EbookApi.BookRecommend(this.widget.bid));
    return DetailRecListModel.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              '书籍详情',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    // padding: EdgeInsets.only(top: 0),
                    children: <Widget>[
                      NovelDetailHeader(_detailModel),
                      NovelSummary(_detailModel.longIntro, _isUnfold, (){
                        setState(() {
                          _isUnfold = !_isUnfold;
                        });
                      }),
                      NovelRecSection(_recListModel)
                    ],
                  ),
                ),
                NovelDetailToolbar(_detailModel),
              ],
            ),
            // buildNavigationBar(),
          ],
        ));
  }
}

// class NovelDetail extends StatefulWidget {
//   final String bid;
//   NovelDetail(this.bid,{Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(title: Text('书籍详情',style: TextStyle(color: Colors.white),),iconTheme: IconThemeData(color: Colors.white,)),
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Expanded(
//                 child: ListView(
//                   // padding: EdgeInsets.only(top: 0),
//                   children: <Widget>[
//                     // NovelDetailHeader(provide.detailModel),
//                     // NovelSummary(provide.detailModel.longIntro, provide.isUnfold, (){
//                     //   provide.changeUnfoldState();
//                     // }),
//                     // NovelRecSection(provide.recListModel)
//                   ],
//                 ),
//               ),
//               NovelDetailToolbar(),
//             ],
//           ),
//           // buildNavigationBar(),
//         ],
//       )
//     );
//   }
// }

// class NovelDetail extends StatelessWidget {
//   final String bid;
//   const NovelDetail(this.bid,{Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Provide.value<BookDetailProvide>(context).reloadData(bid);

//     return Scaffold(
//       appBar: AppBar(title: Text('书籍详情',style: TextStyle(color: Colors.white),),iconTheme: IconThemeData(color: Colors.white,)),
//       body: Provide<BookDetailProvide>(builder: (context,widget,provide)=> Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Expanded(
//                 child: ListView(
//                   // padding: EdgeInsets.only(top: 0),
//                   children: <Widget>[
//                     NovelDetailHeader(provide.detailModel),
//                     NovelSummary(provide.detailModel.longIntro, provide.isUnfold, (){
//                       provide.changeUnfoldState();
//                     }),
//                     NovelRecSection(provide.recListModel)
//                   ],
//                 ),
//               ),
//               NovelDetailToolbar(),
//             ],
//           ),
//           // buildNavigationBar(),
//         ],
//       ),)
//     );
//   }

// }
