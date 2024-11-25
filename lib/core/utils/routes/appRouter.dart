import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/home/logic/home/home_cubit.dart';
import 'package:stylishecommerce/feature/login/ui/login_screen.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';
import 'package:stylishecommerce/feature/product/ui/allProducts.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';
import 'package:stylishecommerce/feature/signup/ui/signup_page.dart';

import '../../../feature/home/logic/categoryProducts/category_products_cubit.dart';
import '../../../feature/home/ui/home_page.dart';
import '../../../feature/home/ui/widget/categoryProducts/productsByCategory.dart';
import '../../../feature/home/ui/widget/search/logic/search_cubit.dart';
import '../../../feature/home/ui/widget/search/ui/search_page.dart';
import '../../../feature/login/logic/login_cubit.dart';
import '../../../feature/product/logic/prodects_cubit.dart';
import '../../../feature/product/ui/productsDetails.dart';
import '../../../feature/profile/ui/profile.dart';
import '../../../feature/signup/logic/signup_cubit.dart';
import '../../../feature/slpash/splash.dart';
import '../../network_service/gititdio.dart';

class AppRouter {

  static Route? route(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPages.login:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                    create: (_) => getIt<LoginCubit>(),
                    child: LoginScreen()));

      case RoutesPages.signup:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                    create: (_) => getIt<SignupCubit>(),
                    child: SignupPage()));


      case RoutesPages.splash:
        return MaterialPageRoute(builder: (_) => const Splash());


      case RoutesPages.search:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<SearchCubit>(),
              child: const SearchPage(),
            ));

      case RoutesPages.home:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                    create: (_) => getIt<HomeCubit>(),
                    child: HomePage()));

      case RoutesPages.profile:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (_) => getIt<ProfileCubit>()..getUser(),
              child: Profile(),
            ));

      case RoutesPages.productsByCategory:
        return MaterialPageRoute(
            builder: (_) =>
            BlocProvider.value(
              value: getIt<CategoryProductsCubit>(),
              child:  ProductsByCategory(categoryName: settings.arguments as String,),
            ));
        
      case RoutesPages.ProductsDetails:
        return MaterialPageRoute(builder: (_) =>
              ProductsDetails(productsModel: settings.arguments as ProductsModel,),
            );

      case RoutesPages.AllProducts:
        return MaterialPageRoute(builder: (_) =>
                AllProducts(),
                // BlocProvider(
                // create: (_) => getIt<ProdectsCubit>()..getAllProducts(),
                // child:AllProducts(),
                // )
        );

      default:
        return null;
    }
  }

}