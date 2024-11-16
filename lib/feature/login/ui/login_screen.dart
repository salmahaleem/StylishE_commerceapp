import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/app_logic/languages/language_cubit.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/login/ui/login_form.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widget/stylishButton.dart';
import '../../../generated/locale_keys.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 24.w),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               // Align(
               //   alignment: Alignment.topRight,
               //   child: IconButton(
               //     icon: const Icon(Icons.language),
               //     onPressed: () {
               //       final newLanguageCode =
               //       context.locale.languageCode == 'en' ? 'ar' : 'en';
               //       context
               //           .read<LanguageCubit>()
               //           .changeLanguage(newLanguageCode);
               //       context.setLocale(Locale(newLanguageCode));
               //     },
               //   ),
               // ),
               verticalSpace(30),
               Text(
                 LocaleKeys.Authentication_title_Login.tr(),
                 style: Theme.of(context)
                     .textTheme
                     .displayLarge
                     ?.copyWith(fontSize: 36.sp, fontWeight: FontWeight.bold),
               ),
               verticalSpace(50),
               LoginForm(),
               verticalSpace(50),
               BlocConsumer<LoginCubit, LoginState>(
                 listener: (context, state) {
                   if (state is LoginLoaded) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text("Login Successful!") , backgroundColor: Color(0xFFA5D6A7),),
                     );
                     context.pushReplacementNamed(RoutesPages.home);
                   } else if (state is LoginFailure) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(state.errorMessage) , backgroundColor: Color(0xFFEF5350)),
                     );
                   }
                 },
                 builder: (context, state) {
                   if (state is LoginLoading) {
                     return Center(child: CircularProgressIndicator());
                   }

                   return StylishButton(
                     text: LocaleKeys.Authentication_Login_bottom.tr(),
                     onPressed: () {
                            context.read<LoginCubit>().login();
                     }
                   );
                 },
               ),
               verticalSpace(30),
               RichText(
                 textAlign: TextAlign.center,
                 text: TextSpan(
                   children: [
                     TextSpan(
                       text: LocaleKeys.Authentication_dont_have_account.tr(),
                       style: Theme.of(context).textTheme.bodyMedium,
                     ),
                     TextSpan(
                       text:  '  ${LocaleKeys.Authentication_create_account.tr()}',
                       style: Theme.of(context).textTheme.displayLarge?.copyWith(
                           color: ColorsMang.stylishRed,
                           fontSize: 13.sp
                       ),
                       recognizer: TapGestureRecognizer()
                         ..onTap = () {
                         },
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }

}