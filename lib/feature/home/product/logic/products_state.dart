part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductsModel> products;
  ProductsLoaded(this.products);
}

final class ProductsFailure extends ProductsState {
  final String errorMessage;
  ProductsFailure(this.errorMessage);
}
