import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'provide/root_pages_provider.dart';
import 'app/application.dart';
import 'bookshelf/shelf_page.dart';
import 'recommend/recommend_page.dart';
import 'search/search_page.dart';
import 'mine/mine_page.dart';

class RootPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.collections_bookmark), title: Text('书架')),
      BottomNavigationBarItem(icon: Icon(Icons.stars), title: Text('推荐')),
      BottomNavigationBarItem(
          icon: Icon(Icons.location_searching), title: Text('搜索')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
    ];

    final _tabPages = <Widget>[
      BookShelfPage(),
      RecommendPage(),
      SearchPage(),
      MinePage()
    ];

    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (_) => RootPagesProvider())],
      child: Consumer<RootPagesProvider>(builder: (_, pageProvider, widget) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1),
          body: IndexedStack(index: pageProvider.page, children: _tabPages),
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomTabs,
            type: BottomNavigationBarType.fixed,
            currentIndex: pageProvider.page,
            onTap: (page) {
              pageProvider.changePage(page);
            },
          ),
        );
      }),
    );
  }
}
