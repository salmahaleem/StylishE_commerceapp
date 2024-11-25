import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';
import 'package:stylishecommerce/feature/home/ui/widget/categoryProducts/productShimmer.dart';

import '../../../logic/categoryProducts/category_products_cubit.dart';
import 'ProductsCardInCategory.dart';

class ProductsByCategory extends StatelessWidget {
  final String categoryName;

  const ProductsByCategory({super.key, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(categoryName),
        floating: true,
        pinned: true,
        expandedHeight: 80.0,
        backgroundColor: ColorsMang.stylishRed,
      ),
      BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
        if (state is CategoryProductsLoading) {
          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 2.5 / 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const ProductShimmerLoading(),
                childCount: 4,
              ),
            ),
          );
        }
        if (state is CategoryProductsLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = state.categoryProducts[index];
                  return ProductsCardInCategory(productsModel: product);
                },
                childCount: state.categoryProducts.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2.5 / 4,
              ),
            ),
          );
        } else if (state is CategoryProductsFailure) {
          return SliverFillRemaining(
            child: Center(child: Text(state.errorMessage)),
          );
        } else
          return Center(
              child: Text(
            "No Products",
            style: Theme.of(context).textTheme.labelLarge,
          ));
      }),
    ]));
  }
}
