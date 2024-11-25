part of 'prodects_cubit.dart';

@immutable
sealed class ProdectsState {}

final class ProdectsInitial extends ProdectsState {}

final class ProdectsLoading extends ProdectsState {}

final class ProdectsLoaded extends ProdectsState {
  final List<ProductsModel> allProducts;
  ProdectsLoaded(this.allProducts);
}

final class ProdectsFailure extends ProdectsState {
  final String errorMessage;
  ProdectsFailure(this.errorMessage);
}

