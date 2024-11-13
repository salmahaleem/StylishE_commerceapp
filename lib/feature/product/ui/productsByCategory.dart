import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylishecommerce/feature/product/logic/products_cubit.dart';
import 'package:stylishecommerce/feature/product/ui/ProductsCardInCategory.dart';

class ProductsByCategory extends StatelessWidget {
  final String categoryName;

  const ProductsByCategory({super.key,required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if(state is ProductsLoading){
          return CircularProgressIndicator();
        }
        if(state is ProductsLoaded){
          return
            Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 2.5 / 4),
                  itemBuilder: (context, index) =>
                      ProductsCardInCategory(productsModel: state.products[index])
              ),
            );

        }
        return Center(child: Text("No Products",style: Theme.of(context).textTheme.labelLarge,));
      },
    );
  }


}