import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'ApiConstant.dart';

class DioServices{
   getDio(){
    Dio dio = Dio(
        BaseOptions(
            baseUrl: ApiConstant.apiBaseUrl,
            connectTimeout: Duration(seconds: 3),
            receiveTimeout:Duration(seconds: 3)));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: false,
      maxWidth: 90,
    ));
    return dio;
  }
}