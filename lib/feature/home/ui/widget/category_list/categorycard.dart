import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/home/product/logic/products_cubit.dart';

class CategoryCard extends StatelessWidget{
    final String category;

    CategoryCard({
      super.key,
      required this.category,
    });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          final productCubit = context.read<ProductsCubit>();
          productCubit.getProductsByCategory(category);
          context.pushNamed(RoutesPages.productsByCategory,arguments: category);
        },
        child: Container(
          width: 200.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),textAlign: TextAlign.start,

                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "See more places",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 16.sp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    }
  }

