import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylishecommerce/core/network_service/authService.dart';
import 'package:stylishecommerce/core/network_service/dioService.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/core/network_service/productService.dart';
import 'package:stylishecommerce/core/network_service/profileService.dart';
import 'package:stylishecommerce/feature/home/logic/home/home_cubit.dart';
import 'package:stylishecommerce/feature/login/logic/login_cubit.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';

import '../../feature/home/logic/categoryProducts/category_products_cubit.dart';
import '../../feature/home/ui/widget/search/logic/search_cubit.dart';
import '../../feature/product/logic/prodects_cubit.dart';
import '../../feature/signup/logic/signup_cubit.dart';

final getIt = GetIt.instance;

void setGitIt() {
  getIt.registerLazySingleton<Dio>(() => DioServices().getDio());
  
  //login
  getIt.registerLazySingleton<AuthService>(()=>AuthService(getIt<Dio>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthService>()));

  //signup
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthService>()));

  //home
  getIt.registerLazySingleton<HomeService>(() => HomeService(getIt<Dio>()));
  getIt.registerLazySingleton<HomeCubit>(()=>HomeCubit(getIt<HomeService>()));
  getIt.registerLazySingleton<CategoryProductsCubit>(() => CategoryProductsCubit(getIt<HomeService>()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(homeCubit: getIt<HomeCubit>(), homeService: getIt<HomeService>()));

  //profile
  getIt.registerLazySingleton<ProfileService>(() => ProfileService(getIt<Dio>()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt<ProfileService>()));

  //product
  getIt.registerLazySingleton<ProductService>(() => ProductService(getIt<Dio>()));
  getIt.registerFactory<ProdectsCubit>(() => ProdectsCubit(getIt<ProductService>()));

}