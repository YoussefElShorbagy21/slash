

import 'package:dio/dio.dart';

import '../../resources/string_manager.dart';

class DioHelper
{
  static late Dio dio ;

  static inti()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );


  }



  static Future<Response> getDate({
  required String url,
   Map<String,dynamic>? query ,
  }) async
  {
    return await dio.get(
      url ,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query ,
    required dynamic data ,
  }) async
  {
     return dio.post(
       url ,
       queryParameters: query,
       data: data,
     );
  }

  static Future<Response> putData({
    required String url,
    Map<String,dynamic>? query ,
    required dynamic data ,
  }) async
  {

    return dio.put(
      url ,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    dynamic data,
  }) async
  {

    return dio.delete(
      url ,
      data: data,
    );
  }
}