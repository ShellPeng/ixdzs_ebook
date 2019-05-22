import 'package:flutter/material.dart';
import '../app/application.dart';
import 'shelf_header.dart';
import 'book_item_cell.dart';
import 'package:provide/provide.dart';
import '../provide/bookshelf_provide.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

class BookShelfPage extends StatelessWidget {
  final GlobalKey<EasyRefreshState> _refreshKey = GlobalKey();
  final GlobalKey<RefreshHeaderState> _headerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Provide.value<BookshelfProvide>(context).reloadData();

    return Scaffold(
        // appBar: AppBar(title: Text('书架',style: TextStyle(color: Colors.white))),
        
        body: NestedScrollView(
            headerSliverBuilder: (context, innerScrolled) => <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverAppBar(
                      pinned: true,
                      centerTitle: true,
                      title: Text(
                        '书架',
                        style: TextStyle(color: Colors.white),
                      ),
                      expandedHeight: Screen.topSafeHeight + 250,
                      flexibleSpace:
                          FlexibleSpaceBar(background: ShelfHeader()),
                      forceElevated: innerScrolled,
                      actions: <Widget>[
                        IconButton(
                          icon: Image.asset('img/actionbar_checkin.png'),
                          onPressed: (){
                            print('签到');
                          },
                        ),
                        IconButton(
                          icon: Image.asset('img/actionbar_search.png'),
                          onPressed: (){
                            
                          },
                        )
                      ],
                    ),
                  )
                ],
            body: Provide<BookshelfProvide>(
                builder: (context, _, provider) => 
                EasyRefresh(
                      key: _refreshKey,
                      refreshHeader:
                          BallPulseHeader(key: _headerKey, color: Colors.pink),
                      onRefresh: () => provider.reloadData(),
                      child: 
                      CustomScrollView(
                        physics: ClampingScrollPhysics(),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                              handle: NestedScrollView
                                  .sliverOverlapAbsorberHandleFor(context)),
                          SliverPadding(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                            sliver: provider.shelfBookList.length > 0
                                ? SliverGrid.count(
                                    crossAxisCount: 1,
                                    childAspectRatio: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    children: provider.shelfBookList
                                        .map((bookModel) =>
                                            BookItemCell(bookModel))
                                        .toList(),
                                  )
                                : SliverToBoxAdapter(),
                          )
                        ],
                      ),
                    )
                    )
                    )
                    );
  }
}

