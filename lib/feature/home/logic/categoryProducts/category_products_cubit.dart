import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';

import '../../../product/model/productsModel.dart';

part 'category_products_state.dart';


class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  HomeService homeService;
  CategoryProductsCubit(this.homeService) : super(CategoryProductsInitial());

  Map<String, List<ProductsModel>> categoryProductCache = {};

  Future<void> getProductWithCategoryName(String categoryName) async {
    if (categoryProductCache.containsKey(categoryName)) {
      emit(CategoryProductsLoaded(categoryProductCache[categoryName]!));
      return;
    }

    emit(CategoryProductsLoading());
    try {
      final categoryProducts =
      await homeService.getProductByCategory(categoryName);
      categoryProductCache[categoryName] = categoryProducts;
      emit(CategoryProductsLoaded(categoryProducts));
    } catch (e) {
      emit(CategoryProductsFailure(
          "Failed to load category products: ${e.toString()}"));
    }
  }

}
