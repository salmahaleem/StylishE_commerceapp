import 'package:dio/dio.dart';

Exception dioErrorHandler(DioException error){
  switch (error.type) {

    case DioExceptionType.connectionError:
      return Exception("Connection error: ${error.message}");
    case DioExceptionType.badResponse:
      return Exception("Invalid response from server: ${error.response?.data}");
    case DioExceptionType.cancel:
      return Exception("Request was cancelled.");
    default:
      return Exception("Unexpected error: ${error.message}");
  }
}