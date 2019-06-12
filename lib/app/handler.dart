import 'package:fluro/fluro.dart';
import '../root_pages.dart';
import '../novel_detail/novel_detail_page.dart';

Handler rootHandler = new Handler(handlerFunc: (_,params) => RootPages());

Handler detailHandler = new Handler(handlerFunc: (context, param) {
  String bid = param['bid']?.first;
  return NovelDetail(bid);
});