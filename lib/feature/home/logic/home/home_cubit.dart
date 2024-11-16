import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeService homeService;
  HomeCubit(this.homeService) : super(HomeInitial()){
    getAllData();
  }
   List<String> categories = [];
   List<ProductsModel> products =[] ;
  
  Future getAllData() async{
    
  emit(HomeLoading());
  try{
    categories = await homeService.getAllCategories();
    products = await homeService.getSortedProducts();
    emit(HomeLoaded(categories,products));

  }catch(error){
    emit(HomeFailure("home error is $error"));
  }

  }
}
