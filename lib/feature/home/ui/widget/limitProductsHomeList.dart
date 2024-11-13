import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/feature/home/logic/home_cubit.dart';
import 'package:stylishecommerce/feature/product/ui/ProductsCardInCategory.dart';

class LimitProductsHomeList extends StatelessWidget{
  const LimitProductsHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
           return CircularProgressIndicator();
          // GridView.builder(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 6,
          //     mainAxisSpacing: 6,
          //     childAspectRatio: 2.5 / 4,
          //   ),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 4,
          //   itemBuilder: (context, index) => const ProductShimmerLoading(),
          // );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(state.errorMesg, style: TextStyle(color: Colors.red)),
          );
        } else if (state is HomeLoaded) {
          final productsToShow = state.products.take(4).toList();

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2.5 / 4,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productsToShow.length,
            itemBuilder: (context, index) {
              final product = productsToShow[index];
              return ProductsCardInCategory(productsModel: product,);
            },
          );
        }
          return const Center(child: Text("No products available"));
      },
    );
  }

  
}