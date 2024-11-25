import 'package:dio/dio.dart';
import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/core/network_service/ErrorService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

class ProductService{

  final Dio dio;
  ProductService(this.dio);

  Future<List<ProductsModel>?> getAllProducts()async{
    try{
      final response = await dio.get(ApiConstant.products);
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