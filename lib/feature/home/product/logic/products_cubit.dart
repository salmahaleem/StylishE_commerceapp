import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/feature/home/product/model/productsModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  HomeService homeService;
  ProductsCubit(this.homeService) : super(ProductsInitial());

   Map<String,List<ProductsModel>> productsCategory = {};

  Future<void> getProductsByCategory (String categoryName)async{
    if (productsCategory.containsKey(categoryName)) {
      emit(ProductsLoaded(productsCategory[categoryName]!));
      return;
    }
    emit(ProductsLoading());
    try{

      final products = await homeService.getProductByCategory(categoryName);
      productsCategory[categoryName] = products;
      emit(ProductsLoaded(products));

    }
    catch(error){
     emit(ProductsFailure('error in get products by category $error'));
    }
  }

  Future getAllProducts() async{
    emit(ProductsLoading());
    try{
      final allproducts = await homeService.getAllProducts();
      emit(ProductsLoaded(allproducts));
    }catch(error){
      emit(ProductsFailure(error.toString()));}
  }
}
