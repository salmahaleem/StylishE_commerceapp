import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/feature/home/ui/widget/search/ui/searchBar.dart';

import '../../categoryProducts/ProductsCardInCategory.dart';
import '../logic/search_cubit.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title:  SearchBarwedgit(
          enabled: true,
          onChanged: (query) {
            context.read<SearchCubit>().searchProducts(query);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text('Search Results'),
            SizedBox(height: 16),
            Expanded(child: SearchResultsGrid()),
          ],
        ),
      ),
    );
  }
  }



class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text('Start typing to search...'),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 2.5 / 4,

            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductsCardInCategory(productsModel: state.products[index]);
            },
          );
        } else if (state is SearchEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}