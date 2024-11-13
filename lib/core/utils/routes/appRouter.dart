import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/home/logic/home_cubit.dart';
import 'package:stylishecommerce/feature/login/ui/login_screen.dart';
import 'package:stylishecommerce/feature/product/logic/products_cubit.dart';
import 'package:stylishecommerce/feature/product/ui/productsByCategory.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';

import '../../../feature/home/ui/home_page.dart';
import '../../../feature/login/logic/login_cubit.dart';
import '../../../feature/profile/ui/profile.dart';
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

      case RoutesPages.splash:
        return MaterialPageRoute(builder: (_) => const Splash());

      case RoutesPages.home:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                    create: (_) => getIt<HomeCubit>(),
                    child: HomePage()));

      case RoutesPages.profile:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (_) => getIt<ProfileCubit>(),
              child: Profile(),
            ));

      case RoutesPages.productsByCategory:
        return MaterialPageRoute(
            builder: (_) =>
            BlocProvider(
              create: (_) => getIt<ProductsCubit>(),
              child:  ProductsByCategory(categoryName: settings.arguments as String,),
            ));


      default:
        return null;
    }
  }

}