import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:ixdzs_ebook/app/application.dart';
import '../provide/recommend_provider.dart';
import 'recommend_header.dart';
import 'recommend_section.dart';
import 'recommend_authors.dart';

class RecommendPage extends StatelessWidget {
  final GlobalKey<EasyRefreshState> _refreshKey = GlobalKey();
  final GlobalKey<RefreshHeaderState> _headerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Provide.value<RecommendProvide>(context).reloadData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_)=>RecommendProvider()..reloadData())
      ],
      child: Scaffold(
      appBar: AppBar(title: Text('推荐',style: TextStyle(color: Colors.white))),
      body: Container(
        child:Consumer<RecommendProvider>(
          builder: (context,recProvide,widget) => EasyRefresh(
          key: _refreshKey,
          refreshHeader:PhoenixHeader(key: _headerKey),
          onRefresh: () => recProvide.reloadData(),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              RecommendHeader(), 
              RecommendSection(recProvide.readNowModel),
              RecommendSection(recProvide.hotRecModel),
              RecommendAuthors(recProvide.hotAuthorModel)
            ],
          ),
        ) ,
        ) 
      ),
    )
    );
  }
}
