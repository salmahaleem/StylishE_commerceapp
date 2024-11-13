import 'package:dio/dio.dart';
import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/core/network_service/ErrorService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

class ProductService{

  final Dio dio;
  ProductService(this.dio);

  Future<List<ProductsModel>> getProductByCategory(String categoryName)async{
    try{
      final response = await dio.get('${ApiConstant.productsByCategory}/${categoryName}');
      if(response.statusCode == 200){
        return (
            response.data['products'])
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

}