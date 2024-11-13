import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class HomeSwiperCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 343.w,
     height: 220.h,

     child: Swiper(
         itemBuilder: (BuildContext context,int index){
           return Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
               child: Image.asset(Assets.imagesSwiperimage,fit: BoxFit.fill,));
         },
         itemCount: 3,
         pagination: SwiperPagination(),
         outer: true,
     ),
   );
  }

}