import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/feature/product/logic/prodects_cubit.dart';
import 'package:stylishecommerce/generated/locale_keys.dart';

import '../../home/ui/widget/categoryProducts/ProductsCardInCategory.dart';
import '../../home/ui/widget/categoryProducts/productShimmer.dart';
import '../model/productsModel.dart';

class AllProducts extends StatelessWidget{

  AllProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocaleKeys.homepage_all_featured.tr()}'  ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProdectsCubit, ProdectsState>(
          builder: (context, state) {
            if (state is ProdectsLoading) {
              return
                GridView.builder(
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
                );
            } else if (state is ProdectsFailure) {
              return Center(
                child: Text(state.errorMessage, style: TextStyle(color: Colors.red)),
              );
            } else if (state is ProdectsLoaded) {
              final productsToShow = state.allProducts.toList();
        
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
                  return ProductsCardInCategory(productsModel: product);
                },
              );
            }
            return const Center(child: Text("No products available"));
          },
        ),
      )
    );
  }

}