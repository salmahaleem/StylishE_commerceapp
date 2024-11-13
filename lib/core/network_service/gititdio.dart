import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylishecommerce/core/network_service/authService.dart';
import 'package:stylishecommerce/core/network_service/dioService.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/core/network_service/productService.dart';
import 'package:stylishecommerce/core/network_service/profileService.dart';
import 'package:stylishecommerce/feature/home/logic/home_cubit.dart';
import 'package:stylishecommerce/feature/login/logic/login_cubit.dart';
import 'package:stylishecommerce/feature/product/logic/products_cubit.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';

final getIt = GetIt.instance;

void setGitIt() {
  getIt.registerLazySingleton<Dio>(() => DioServices().getDio());
  
  //login
  getIt.registerLazySingleton<AuthService>(()=>AuthService(getIt<Dio>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthService>()));
  //home
  getIt.registerLazySingleton<HomeService>(() => HomeService(getIt<Dio>()));
  getIt.registerFactory<HomeCubit>(()=>HomeCubit(getIt<HomeService>()));

  //profile
  getIt.registerLazySingleton<ProfileService>(() => ProfileService(getIt<Dio>()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt<ProfileService>()));

  //product
  getIt.registerLazySingleton<ProductService>(() => ProductService(getIt<Dio>()));
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt<ProductService>()));

}