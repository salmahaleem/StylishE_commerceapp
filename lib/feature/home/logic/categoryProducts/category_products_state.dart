part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {}

final class CategoryProductsLoaded extends CategoryProductsState {
  final List<ProductsModel> categoryProducts;
  CategoryProductsLoaded(this.categoryProducts);
}

final class CategoryProductsFailure extends CategoryProductsState {
  final String errorMessage;
  CategoryProductsFailure(this.errorMessage);
}
