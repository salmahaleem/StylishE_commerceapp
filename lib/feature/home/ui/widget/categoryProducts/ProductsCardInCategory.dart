import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/appRouter.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';

import '../../../../product/model/productsModel.dart';
import '../../../../product/ui/productsDetails.dart';

class ProductsCardInCategory extends StatelessWidget {
  final ProductsModel productsModel;

  const ProductsCardInCategory({super.key, required this.productsModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(RoutesPages.ProductsDetails, arguments: productsModel);
      },
      child: Card(
        child: Column(
          children: [
            ClipRRect(
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
            ),
            verticalSpace(5.h),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                _ProductTitle(context),
                verticalSpace(3.h),
                _ProductCategory(),
                verticalSpace(3.h),
                _ProductPrice(),
                verticalSpace(3.h),
                _ProductRating(),
              ],),
            )

          ],
        ),
      ),
    );
  }

  // Widget _buildProductImage() {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
  //     child: Image.network(
  //       productsModel.images[0],
  //       height: 130.h,
  //       width: 156.w,
  //       fit: BoxFit.cover,
  //       loadingBuilder: (context, child, loadingProgress) {
  //         if (loadingProgress == null) return child;
  //         return Center(child: CircularProgressIndicator());
  //       },
  //       errorBuilder: (context, error, stackTrace) =>
  //       const Icon(Icons.error, size: 40),
  //     ),
  //   );
  // }

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
