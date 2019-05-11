import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

const serviceUrl = 'http://api.ixdzs.com/';

class EbookApi {
  static const update = '$serviceUrl/update';

}

Future<Response> request(String ebookApi,{Map<String, dynamic> params}) async{
  try{
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
    if (params == null) {
      response = await dio.get(ebookApi);
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