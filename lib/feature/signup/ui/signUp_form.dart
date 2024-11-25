import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/core/widget/stylishFormTextField.dart';
import 'package:stylishecommerce/feature/signup/logic/signup_cubit.dart';

import '../../../generated/locale_keys.dart';

class SignupForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Form(
      key: signupCubit.formKey,
      child: Column(
        children: [
          StylishFormTextField(
            hintText: LocaleKeys.Authentication_first_name.tr(),
            controller: signupCubit.firstNameController,
            isObscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.Authentication_enterEmail.tr();
              }
              return null;
            },
          ),
          verticalSpace(20),
          StylishFormTextField(
            hintText: LocaleKeys.Authentication_last_name.tr(),
            controller: signupCubit.lastNameController,
            isObscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.Authentication_user_name.tr();
              }
              return null;
            },
          ),
          verticalSpace(20),
          StylishFormTextField(
            hintText: LocaleKeys.Authentication_enterEmail.tr(),
            controller: signupCubit.emailController,
            isObscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.Authentication_user_name.tr();
              }
              return null;
            },
          ),
          verticalSpace(20),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              bool isPasswordVisible = false;
              if (state is SignupPasswordToggle) {
                isPasswordVisible = state.isPasswordVisable;
              }
              return StylishFormTextField(
                hintText: LocaleKeys.Authentication_password.tr(),
                controller: signupCubit.passwordController,
                isObscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<SignupCubit>().toggle();
                  },
                  icon: Icon(isPasswordVisible ? Icons.remove_red_eye_outlined:Icons.remove_red_eye,),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.Authentication_enterPassword.tr();
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),

    );
  }


}