import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/core/widget/stylishButton.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

import '../../../core/utils/colors.dart';

class ProductsDetails extends StatelessWidget{
  ProductsModel productsModel;

  ProductsDetails({super.key,required this.productsModel});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Hero(
       tag:"${productsModel.images}" ,
       child: Padding(
         padding: const EdgeInsets.only(top: 15.0),
           child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   AspectRatio(
                     aspectRatio: 16 / 16,
                     child: ClipRRect(
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(15),
                           topRight: Radius.circular(15),
                         ),
                         child: Image.network(
                           productsModel.images[0] ,
                           height: 300.h,
                           width: double.infinity,
                           fit: BoxFit.cover,
                           errorBuilder: (context, error, stackTrace) {
                             return Container(
                               color: Colors.grey,
                               child: Icon(
                                 Icons.broken_image_rounded,
                                 color: Colors.white12,
                                 size: 80.sp,
                               ),
                             );
                           },
                         )),
                   ),
                   Container(
                     height: 700.h,
                     decoration: BoxDecoration(
                          color: Colors.white,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r))),
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Column(
                             children: [
                               verticalSpace(20.h),
                               _ProductTitle(context),
                               verticalSpace(20.h),
                               _ProductCategory(),
                               verticalSpace(20.h),
                               Text(productsModel.description ?? "non",style: Theme.of(context).textTheme.bodyMedium,),
                               verticalSpace(20.h),
                               _ProductPrice(),
                               verticalSpace(20.h),
                               _ProductRating(),
                               verticalSpace(80.h),
                               StylishButton(
                                   icon: Icons.shopping_cart,
                                   text: "But to Cart" , onPressed: (){
                               })
                             ]),
                       )),

                 ],
               ),
             ),
         ),
     ),
   );
  }
  Widget _ProductTitle(BuildContext context) {
    return Text(
      productsModel.title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: ColorsMang.stylishRed
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _ProductCategory() {
    return Row(
      children: [
        Text(
          productsModel.category??"",
          style: TextStyle(fontSize: 12.sp,
              color: Colors.grey),
        ),
      ],
    );
  }

  Widget _ProductPrice() {
    return Text(
      '${productsModel.price} \$',
      style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold, color: Colors.black),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _ProductRating() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 14.sp),
        SizedBox(width: 4.w),
        Text(
          productsModel.rating.toString(),
          style: TextStyle(fontSize: 12.sp),
        ),
        SizedBox(width: 4.w),
        Text(
          "(${productsModel.rating})",
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }



}