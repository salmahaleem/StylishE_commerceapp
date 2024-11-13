import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';

import '../../../../../generated/locale_keys.dart';

class Fillterbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      child: Row(
        children: [
          Text(LocaleKeys.homepage_all_featured.tr(),style: TextStyle(fontWeight: FontWeight.bold),),
            horizontalSpace(48),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  ButtonsTabBar(
                    width: 100.w,
                          tabs: [
                            Tab(text: LocaleKeys.homepage_sort.tr(),icon:Icon(Icons.compare_arrows)),
                            Tab(text: LocaleKeys.homepage_filter.tr(),icon:Icon(Icons.filter_list_alt) ),
                          ],
                          backgroundColor: Colors.white,
                          unselectedBorderColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          buttonMargin: const EdgeInsets.all(5),
                          labelSpacing: 10,
                          labelStyle: TextStyle(color: Colors.black),
                          unselectedLabelStyle: TextStyle(color: Colors.black),
                         // labelStyle:  ,
                        ),
                  // Expanded(
                  //     child: TabBarView(
                  //       children: [
                  //
                  //       ],))
                ],
              ),
            ),

        ]),
    );
  }

}