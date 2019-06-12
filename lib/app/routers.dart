import 'package:fluro/fluro.dart';
import 'handler.dart';

class Routers{
  static String _root = '/';
  static String _details = '/details';

  static void configRouters(Router router){
    router.notFoundHandler = Handler(handlerFunc: (_,params){
      print('not found');
    });
    router.define(_root,handler: rootHandler);
    router.define(_details,handler: detailHandler);
  }
  static String generateDetailsRouterPath(String id) => '$_details?bid=$id';
}