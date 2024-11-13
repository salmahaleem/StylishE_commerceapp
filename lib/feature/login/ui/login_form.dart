import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/feature/login/logic/login_cubit.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widget/stylishFormTextField.dart';
import '../../../generated/locale_keys.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          StylishFormTextField(
            hintText: LocaleKeys.Authentication_user_name.tr(),
            controller: loginCubit.usernameController,
            isObscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.Authentication_enterEmail.tr();
              }
              return null;
            },
          ),
          verticalSpace(20),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              bool isPasswordVisible = false;
              if (state is LoginPasswordToggle) {
                isPasswordVisible = state.isPasswordVisable;
              }
              return StylishFormTextField(
                hintText: LocaleKeys.Authentication_password.tr(),
                controller: loginCubit.passwordController,
                isObscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<LoginCubit>().toggle();
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