import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/core/network_service/productService.dart';
import 'package:stylishecommerce/core/network_service/profileService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductService productService;
  ProductsCubit(this.productService) : super(ProductsInitial()){
    getProductsByCategory;
  }

   Map<String,List<ProductsModel>> productsCategory = {};

  Future<void> getProductsByCategory (String categoryName)async{

    try{
      if (productsCategory.containsKey(categoryName)) {
        emit(ProductsLoaded(productsCategory[categoryName]!));
        return;
      }
      emit(ProductsLoading());
      final products = await productService.getProductByCategory(categoryName);
      productsCategory[categoryName] = products;
      emit(ProductsLoaded(products));

    }
    catch(error){
     emit(ProductsFailure('error in get products by category $error'));
    }
  }
}
