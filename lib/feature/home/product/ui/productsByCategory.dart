import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/feature/home/product/logic/products_cubit.dart';
import 'package:stylishecommerce/feature/home/product/ui/ProductsCardInCategory.dart';
import 'package:stylishecommerce/feature/home/product/ui/productShimmer.dart';

class ProductsByCategory extends StatelessWidget {
  final String categoryName;

  const ProductsByCategory({super.key,required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if(state is ProductsLoading){
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 2.5 / 4,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => const ProductShimmerLoading(),
          );        }
        else if(state is ProductsLoaded){
          final productsToShow = state.products.take(4).toList();
          return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productsToShow.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 2.5 / 4),
                  itemBuilder: (context, index) {
                    final product = productsToShow[index];
                    ProductsCardInCategory(productsModel: product);
                  }

            );
        }else if(state is ProductsFailure){
          return const SizedBox.shrink();
        }
        return Center(child: Text("No Products",style: Theme.of(context).textTheme.labelLarge,));
      },
    );
  }


}