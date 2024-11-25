import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/core/widget/stylishButton.dart';
import 'package:stylishecommerce/feature/signup/logic/signup_cubit.dart';
import 'package:stylishecommerce/feature/signup/ui/signUp_form.dart';

import '../../../core/utils/colors.dart';
import '../../../generated/locale_keys.dart';

class SignupPage extends StatelessWidget{
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
                verticalSpace(30),
                Text(
                  LocaleKeys.Authentication_create_account.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 36.sp, fontWeight: FontWeight.bold),
                ),
                verticalSpace(50),
                SignupForm(),
                verticalSpace(50),
                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful!") , backgroundColor: Color(0xFFA5D6A7),),
                      );
                      context.pushReplacementNamed(RoutesPages.home);
                    } else if (state is SignupFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage) , backgroundColor: Color(0xFFEF5350)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignupLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return StylishButton(
                        text: LocaleKeys.Authentication_create_account.tr(),
                        onPressed: () {
                          context.read<SignupCubit>().signUp();
                          //context.pushNamed(RoutesPages.home);
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
                        text: LocaleKeys.Authentication_already_have_account.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text:  '  ${LocaleKeys.Authentication_Login_bottom.tr()}',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: ColorsMang.stylishRed,
                            fontSize: 13.sp
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          context.pushNamed(RoutesPages.login);
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