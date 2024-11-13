import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stylishecommerce/app_logic/theme/theme_cubit.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/generated/locale_keys.dart';

import '../../../../app_logic/languages/language_cubit.dart';
import '../../../../core/utils/routes/routes_pages.dart';

class SideBarWidget extends StatelessWidget{
  final SidebarXController sidebarXController;

  const SideBarWidget({Key? super.key,required SidebarXController sideController}):sidebarXController =  sideController;
  final bool isMode = false;
  @override
  Widget build(BuildContext context) {
    return SidebarX
      (
      controller: sidebarXController,
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        iconTheme: IconThemeData(
          color: ColorsMang.textInField,
        )
      ),
      extendedTheme: SidebarXTheme(width: 140.w),
      headerBuilder: (context,extended){
        return SizedBox(
          width: 100.w,
          height: 100.h,
          child:Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(Icons.person,size: 40.r,color: ColorsMang.stylishRed),
          ),

        );
      },
      items: [
        SidebarXItem(
            icon:Icons.language ,
            label: '  ${LocaleKeys.homepage_language.tr()}'
            ,onTap: (){
            final newLanguageCode = context.locale.languageCode == 'en' ? 'ar' : 'en';
            context
              .read<LanguageCubit>()
              .changeLanguage(newLanguageCode);
            context.setLocale(Locale(newLanguageCode));
        }),
        SidebarXItem(
          label: '  ${LocaleKeys.homepage_mode.tr()}',
          onTap: (){
          // context.read<ThemeCubit>().state.themeData.brightness ==
          //     Brightness.dark;
         context.read<ThemeCubit>().themeToggle();
          },
          icon: isMode? Icons.dark_mode:Icons.light_mode ,
          selectable: true,
         ),
        SidebarXItem(
            icon:Icons.person ,
            label: '  ${LocaleKeys.homepage_profile.tr()}',
            onTap: (){context.pushNamed(RoutesPages.profile);}),

      ],

    );
  }

}