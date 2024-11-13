import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerlist extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: 100.w,
     height: 100.h,
     child:Shimmer.fromColors(
         baseColor: Colors.grey.shade300,
         highlightColor:  Colors.grey.shade100,
         child: Container(
           decoration: BoxDecoration(
             color: Colors.grey.shade300,
             borderRadius: BorderRadius.circular(20.r),
           ),
           child: Center(
             child: Container(
               width: 60.w,
               height: 12.h,
               color: Colors.grey.shade300,
             ),
           ),
         ),
     )
   );
  }

}