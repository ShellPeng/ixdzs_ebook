import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'app/application.dart';

import 'provide/root_pages_provide.dart';
import 'provide/bookshelf_provide.dart';
import 'provide/recommend_provide.dart';
import 'provide/booksearch_provide.dart';
import 'provide/bookdetail_provide.dart';

import 'package:provide/provide.dart';
import 'ebook_app.dart';
import 'app/routers.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;

  final providers = Providers()
    ..provide(Provider.function((_) => BookDetailProvide()))
    ..provide(Provider.function((_) => BookSearchProvide()))
    ..provide(Provider.function((_) => RecommendProvide()))
    ..provide(Provider.function((_) => BookshelfProvide()))
    ..provide(Provider.function((_) => RootPagesProvide()));

  final Router router = Router();
  Routers.configRouters(router);
  Application.router = router;
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderNode(child: EbookApp(), providers: providers));
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    } else {}
  });
}
