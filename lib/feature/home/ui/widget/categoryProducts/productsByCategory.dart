import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/feature/home/ui/widget/categoryProducts/productShimmer.dart';

import '../../../logic/categoryProducts/category_products_cubit.dart';
import 'ProductsCardInCategory.dart';

class ProductsByCategory extends StatelessWidget {
  final String categoryName;

  const ProductsByCategory({super.key,required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if(state is CategoryProductsLoading){
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
          else if(state is CategoryProductsLoaded){
            //final productsToShow = state.categoryProducts.take(4).toList();
            return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.categoryProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 2.5 / 4),
                itemBuilder: (context, index) {
                   final product = state.categoryProducts[index];
                    ProductsCardInCategory(productsModel: product);
                    return null;
                }
      
            );
          }else if(state is CategoryProductsFailure){
            return const SizedBox.shrink();
          }
          return Center(child: Text("No Products",style: Theme.of(context).textTheme.labelLarge,));
        },
      ),
    );
  }


}