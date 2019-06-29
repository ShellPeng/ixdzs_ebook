import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'app/application.dart';

import 'provide/bookshelf_provider.dart';

import 'ebook_app.dart';
import 'app/routers.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  SpUtil.getInstance();

  final Router router = Router();
  Routers.configRouters(router);
  Application.router = router;
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_)=>BookshelfProvider()..reloadData())
    ],child: EbookApp()));
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    } else {}
  });
}
