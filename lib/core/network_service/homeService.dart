

import 'package:dio/dio.dart';

import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/core/network_service/ErrorService.dart';

import '../../feature/product/model/productsModel.dart';

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

  Future<List<ProductsModel>> getAllProducts() async{
    try {
      final response = await dio.get(ApiConstant.products);
      if(response.statusCode == 200){
        return (response.data['products'])
            .map((json)=>ProductsModel.fromJson(json))
            .toList();
      }else{
        throw Exception("Unexpected error while loading all products");
      }

    }on DioException catch (error) {
      throw dioErrorHandler(error);
    } catch (e) {
      throw Exception("Unexpected error while loading all products: $e");
    }
  }

  Future<List<ProductsModel>> getProductByCategory(String categoryName)async{
    try{
      final response = await dio.get('${ApiConstant.productsByCategory}/${categoryName}');
      if(response.statusCode == 200){
        return (
            response.data['products']as List)
            .map((json)=>ProductsModel.fromJson(json))
            .toList();
      }else{
        throw Exception("Failed to get products by category ${response.statusCode}");
      }
    }on DioException catch (error) {
      throw dioErrorHandler(error);
    }
    catch(error){
      throw Exception("error while loading products by category $error");
    }
  }

  Future<List<ProductsModel>> searchProducts(String query) async {
    try {
      final response = await dio.get(
        ApiConstant.search,
        queryParameters: {
          'search': query
        },
      );

      if (response.statusCode == 200) {
        return (response.data['products'] as List)
            .map((json) => ProductsModel.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load search results: Status code ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    } catch (e) {
      throw Exception("Unexpected error while searching products: $e");
    }
  }
 }

