import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/feature/product/model/productsModel.dart';

class ProductsCardInCategory extends StatelessWidget{
  final ProductsModel productsModel;

  const ProductsCardInCategory({super.key,required this.productsModel});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        //context.pushNamed(Routes.productDetailsScreen, arguments: product);
      },
      child: Container(
        width: 164.w,
        height: 245.h,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductImage(),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProductTitle(context),
                  verticalSpace(3.h),
                  ProductCategory(),
                  verticalSpace(2.h),
                  ProductPrice(),
                  verticalSpace(2.h),
                  ProductRating(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Image.network(
        productsModel.images[0],
        height: 130.h,
        width: 156.w,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.error, size: 40),
      ),
    );
  }

  Widget ProductTitle(BuildContext context) {
    return Text(
      productsModel.title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget ProductCategory() {
    return Row(
      children: [
        Text(
          productsModel.category ?? " ",
          style: TextStyle(fontSize: 12.sp,
              color: Colors.grey),
        ),
      ],
    );
  }

  Widget ProductPrice() {
    return Text(
      '${productsModel.price} \$',
      style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold, color: Colors.black),
      overflow: TextOverflow.ellipsis,
    );
  }


  Widget ProductRating() {
    return Row(
      children: [
        Icon(Icons.star, color: ColorsMang.rating, size: 14.sp),
        horizontalSpace(4.w),
        Text(
          productsModel.rating.toString(),
          style: TextStyle(fontSize: 12.sp),
        ),
        horizontalSpace(4.w),
        Text(
          "(${productsModel.rating})",
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }

}