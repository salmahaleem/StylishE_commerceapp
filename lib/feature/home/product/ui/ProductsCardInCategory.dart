import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/feature/home/product/model/productsModel.dart';

class ProductsCardInCategory extends StatelessWidget{
  final ProductsModel productsModel;

  const ProductsCardInCategory({super.key,required this.productsModel});
  @override
  Widget build(BuildContext context) {
    return Card(
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
          verticalSpace(3.h),
          Text(productsModel.title),
        ],
      ),
    );
  }
  //   return Scaffold(
  //     body: GestureDetector(
  //       onTap: () {
  //        // context.pushNamed(Routes.productDetailsScreen, arguments: product);
  //       },
  //       child: Container(
  //         width: 180.w,
  //         margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12.r),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(0.1),
  //               blurRadius: 8,
  //               offset: const Offset(0, 3),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ClipRRect(child: Image.network(
  //               productsModel.images[0],
  //               height: 130.h,
  //               width: 156.w,
  //               fit: BoxFit.cover,
  //               loadingBuilder: (context, child, loadingProgress) {
  //                 if (loadingProgress == null) return child;
  //                 return Center(child: CircularProgressIndicator());
  //               },)),
  //             Padding(
  //               padding: EdgeInsets.all(8.sp),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(productsModel.title),
  //                   verticalSpace(2.h),
  //                   Text('${productsModel.category}'),
  //                   verticalSpace(2.h),
  //                   Text('${productsModel.price}'),
  //                   verticalSpace(2.h),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

  // Widget _buildProductTitle(BuildContext context) {
  //   return Text(
  //     productsModel.title,
  //     style: Theme.of(context).textTheme.labelLarge?.copyWith(
  //       fontSize: 16.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     maxLines: 1,
  //     overflow: TextOverflow.ellipsis,
  //   );
  // }
  //
  // Widget _buildProductCategory() {
  //   return Row(
  //     children: [
  //       Text(
  //         productsModel.category??"",
  //         style: TextStyle(fontSize: 12.sp,
  //             color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildProductPrice() {
  //   return Text(
  //     '${productsModel.price} \$',
  //     style: TextStyle(
  //         fontSize: 12.sp,
  //         fontWeight: FontWeight.bold, color: Colors.black),
  //     overflow: TextOverflow.ellipsis,
  //   );
  // }
  //
  //
  // Widget _buildProductRating() {
  //   return Row(
  //     children: [
  //       Icon(Icons.star, color: Colors.amber, size: 14.sp),
  //       SizedBox(width: 4.w),
  //       Text(
  //         productsModel.rating.toString(),
  //         style: TextStyle(fontSize: 12.sp),
  //       ),
  //       SizedBox(width: 4.w),
  //       Text(
  //         "(${productsModel.rating})",
  //         style: TextStyle(fontSize: 12.sp, color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }

}