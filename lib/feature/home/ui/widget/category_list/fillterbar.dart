import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/network_service/gititdio.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';


import '../../../../../generated/locale_keys.dart';
import '../../../product/logic/products_cubit.dart';

class Fillterbar extends StatelessWidget{

  Fillterbar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) => getIt<ProductsCubit>(),
      child: Container(
      width: 340.w,
      child: Row(
        children: [
          Text(LocaleKeys.homepage_all_featured.tr(),style: TextStyle(fontWeight: FontWeight.bold),),
            horizontalSpace(33.w),
          ElevatedButton(
            onPressed: (){
              showFlexibleBottomSheet(
                context: context,
                builder:  _buildBottomSheet,
              );
            }, child: Row(children: [Text(LocaleKeys.homepage_sort.tr()),Icon(Icons.compare_arrows)],),),
          horizontalSpace(2.w),
          ElevatedButton(
            onPressed: (){
              showFlexibleBottomSheet(
                context: context,
                builder:  _buildBottomSheet,
              );
            }, child: Row(children: [Text(LocaleKeys.homepage_filter.tr()),Icon(Icons.filter_list_alt)],),),

        ]),
          ),
    );
  }

  Widget _buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return Material(
      child: Container(
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("ALL"),
              onTap: (){
                final productCubit = context.read<ProductsCubit>();
                 productCubit.getAllProducts();
                 context.pushNamed(RoutesPages.productsByCategory);
              },
            );
        },
        ),
      ),
    );
  }
}