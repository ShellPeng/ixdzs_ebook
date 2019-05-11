import 'package:flutter/material.dart';
import '../app/application.dart';
import 'shelf_header.dart';
import 'book_item_cell.dart';
import 'package:provide/provide.dart';
import '../provide/bookshelf_provide.dart';

class BookShelfPage extends StatelessWidget {
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
                      title: Text(
                        '书架',
                        style: TextStyle(color: Colors.white),
                      ),
                      expandedHeight: Screen.height * 0.3,
                      flexibleSpace:
                          FlexibleSpaceBar(background: ShelfHeader()),
                      forceElevated: innerScrolled,
                    ),
                  )
                ],
            body: Provide<BookshelfProvide>(
              builder: (context, _, provider) => CustomScrollView(
                    slivers: <Widget>[
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        sliver: provider.shelfBookList.length > 0
                            ? SliverGrid.count(
                                crossAxisCount: 1,
                                childAspectRatio: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children: provider.shelfBookList
                                    .map((bookModel) => BookItemCell(bookModel))
                                    .toList(),
                              )
                            : SliverToBoxAdapter(),
                      )
                    ],
                  ),
            )));
  }
}
