import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import '../../../../generated/locale_keys.dart';




class SearchBarwedgit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: LocaleKeys.homepage_search_bar.tr(),
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),
              suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.mic,color: Colors.grey),),
              prefixIcon: Icon(Icons.search,color: Colors.grey),
              border: InputBorder.none
              )
              )
            ),
    );
  }

}