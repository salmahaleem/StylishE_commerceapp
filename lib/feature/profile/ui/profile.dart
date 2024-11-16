import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/core/widget/stylishButton.dart';
import 'package:stylishecommerce/feature/profile/logic/profile_cubit.dart';
import 'package:stylishecommerce/feature/profile/model/model.dart';
import 'package:stylishecommerce/feature/profile/ui/widget/image_personal.dart';
import 'package:stylishecommerce/feature/profile/ui/widget/profileDetails.dart';
import 'package:stylishecommerce/generated/locale_keys.dart';

class Profile extends StatelessWidget {
  final ProfileModel? profileModel;

  const Profile({super.key, this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Saved Update!") , backgroundColor: Color(0xFFA5D6A7),),
            );
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage) , backgroundColor: Color(0xFFEF5350)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return CircularProgressIndicator();
          }
          else if (state is ProfileLoaded) {
            final profileCubit = context.read<ProfileCubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ProfileDetails(profileModel: state.profileModel),
                    verticalSpace(10),
                    StylishButton(
                        text: LocaleKeys.profile_Save.tr(),
                        onPressed: () {
                          profileCubit.updateUser();
                        }),
                  ],
                ),
              ),
            );

          }else if(state is ProfileFailure){
            return Text(state.errorMessage);
          }else{
          return Center(child: SizedBox.shrink());}
        },
      ),
    );
  }

}