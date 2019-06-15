import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

const serviceUrl = 'http://api.ixdzs.com';

class EbookApi {
  static const Update = '$serviceUrl/update';
  static const Readnow = '$serviceUrl/readnow';
  static const Recommend = '$serviceUrl/recommend';
  static const HotAuthor = '$serviceUrl/hotauthor';
  static const HotWords = '$serviceUrl/book/hot-word';
  static const Search = '$serviceUrl/book/search';
  
  static String BookRecommend(String novelId) {
    return '$serviceUrl/book-list/$novelId/recommend';
  }
  static String BookDetail(String novelId) {
    return '$serviceUrl/book/$novelId';
  }
  static String Chapter(int novelId,int chapter) {
    return '$serviceUrl/chapter/$novelId/$chapter';
  }
  static String ChapterList(int novelId) {
    if (Platform.isIOS) {
      return '$serviceUrl/content-ios/$novelId';
    } else {
      return '$serviceUrl/content-android/$novelId';
    }
  }
  
}

Future<Response> request(String ebookApi,{Map<String, dynamic> params}) async{
  try{
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
    if (params == null) {
      response = await dio.get(ebookApi);
      print(ebookApi);
      print(response.data.toString());
    } else {
      // response = await dio.post(method,data:params);
      response = await dio.get(ebookApi,queryParameters: params);
      
      print(response.data.toString());
    }
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('网络故障');
    }
  }catch(e){
    print('Error:$e');
    return null;
  }
}