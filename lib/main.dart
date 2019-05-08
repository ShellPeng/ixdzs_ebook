import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'app/application.dart';
import 'provide/root_pages_provide.dart';
import 'package:provide/provide.dart';
import 'ebook_app.dart';
import 'app/routers.dart';

void main() {
  final providers = Providers()
    // ..provide(Provider.function((_) => HomeProvider()))
    // ..provide(Provider.function((_) => CategoryGoodsProvider()))
    // ..provide(Provider.function((_) => CategorySubCategoryProvider()))
    ..provide(Provider.function((_) => RootPagesProvide()));

    final Router router = Router();
  Routers.configRouters(router);
  Application.router = router;
  // 强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_){
    runApp(ProviderNode(child:EbookApp(), providers: providers));
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    } else {
      
    }
  });
}