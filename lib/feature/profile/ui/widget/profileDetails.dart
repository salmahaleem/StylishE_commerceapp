import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/core/widget/stylishFormTextField.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';
import 'package:stylishecommerce/generated/locale_keys.dart';

import '../../../../core/widget/stylishFormTextField.dart';

class ProfileDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return SingleChildScrollView(
      child: Column(
          children: [
            //personal
            Text(LocaleKeys.profile_personal_details.tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
            verticalSpace(20),
            StylishFormTextField(
              hintText: LocaleKeys.Authentication_account_email.tr(),
              controller: cubit.emailController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: LocaleKeys.Authentication_password.tr(),
              controller: cubit.passwordController,
              isObscureText: true,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: LocaleKeys.Authentication_user_name.tr(),
              controller: cubit.usernameController,
              isObscureText: false,
            ),
            verticalSpace(20),
            Text(LocaleKeys.profile_Business_Address_Details.tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
            verticalSpace(20),
            StylishFormTextField(
              hintText: "PostalCode",
              controller: cubit.postalCodeController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "Address",
              controller: cubit.addressController,
              isObscureText:false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "City",
              controller: cubit.cityController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "State",
              controller: cubit.stateController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "Country",
              controller: cubit.countryController,
              isObscureText: false,
            ),
            verticalSpace(20),
            Text(LocaleKeys.profile_Bank_Account_Details.tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
            verticalSpace(20),
            StylishFormTextField(
              hintText: "Bank Account Number",
              controller: cubit.cardNumberController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "CardType",
              controller: cubit.cardTypeController,
              isObscureText: false,
            ),
            verticalSpace(10),
            StylishFormTextField(
              hintText: "Iban",
              controller: cubit.ibanController,
              isObscureText: false,
            ),
          ],
        ),
    );
  }

}