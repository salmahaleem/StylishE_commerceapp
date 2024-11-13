import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/network_service/homeService.dart';
import 'package:stylishecommerce/core/shared/stylishSharedPreferences.dart';
import 'package:stylishecommerce/core/utils/routes/appRouter.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/home/product/logic/products_cubit.dart';

import 'app_logic/languages/language_cubit.dart';
import 'app_logic/theme/theme_cubit.dart';
import 'core/network_service/gititdio.dart';
import 'generated/codegenrated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StylishSharedPreferences.init();
  setGitIt();
  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translate',
          fallbackLocale: const Locale('en'),
          assetLoader: CodeGenerated(),
          child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => ThemeCubit()),
                BlocProvider(create: (_) => LanguageCubit()),
                BlocProvider(create: (_)=>ProductsCubit(HomeService(Dio()))),
              ],
              child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final themeData = themeState.themeData;
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            final locale = languageState is LanguageChanged
                ? languageState.locale
                : const Locale('en');

            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Stylish',
                  theme: themeData,
                  locale: locale,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  localeResolutionCallback: (locale, supportedLocales) {
                    return supportedLocales.contains(locale)
                        ? locale
                        : const Locale('en');
                  },
                  onGenerateRoute: AppRouter.route,
                  initialRoute: RoutesPages.home,
                );
              },
            );
          },
        );
      },
    );
  }
}




