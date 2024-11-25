import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/productService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

part 'prodects_state.dart';

class ProdectsCubit extends Cubit<ProdectsState> {
  ProductService productService;
  ProdectsCubit(this.productService) : super(ProdectsInitial());

  Future <void> getAllProducts()async{
    emit(ProdectsLoading());
    try{
      final allProducts = await productService.getAllProducts();
      emit(ProdectsLoaded(allProducts!));
    }catch(error){
      emit(ProdectsFailure(error.toString()));
    }

  }
}
