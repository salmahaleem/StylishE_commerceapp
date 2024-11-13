part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<String> category;
  final List<ProductsModel> products;
  HomeLoaded(this.category,this.products);
}

final class HomeFailure extends HomeState {
  final String errorMesg;
  HomeFailure(this.errorMesg);
}
