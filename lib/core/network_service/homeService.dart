

import 'package:dio/dio.dart';

import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/core/network_service/ErrorService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

class HomeService{
  final Dio dio;
  HomeService(this.dio);

  Future<List<String>> getAllCategories() async {
    try {
      final response = await dio.get(ApiConstant.categoryList);
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      } else {
        throw Exception(
            "Failed to load categories: Status code ${response.statusCode}");
      }
    } on DioException catch (error) {
      throw dioErrorHandler(error);
    } catch (error) {
      throw Exception("Unexpected error while loading categories: $error");
    }
  }

 Future <List<ProductsModel>>getSortedProducts() async{
    try{
      final response = await dio.get(ApiConstant.products,
        queryParameters: {'sortBy':'title','order':'asc'});
      if(response.statusCode == 200 ){
        return (response.data['products'] as List)
            .map((json) => ProductsModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            "Failed to load products: Status code ${response.statusCode}");

    }
 } on DioException catch (error) {
  throw dioErrorHandler(error);
  } catch (e) {
  throw Exception("Unexpected error while loading products: $e");
  }
    }
 }

