import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/spacing.dart';
import 'package:stylishecommerce/feature/home/logic/home/home_cubit.dart';
import 'package:stylishecommerce/feature/home/ui/widget/category_list/categorycard.dart';
import 'package:stylishecommerce/feature/home/ui/widget/category_list/shimmerList.dart';

class CategoryList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Align(alignment: AlignmentDirectional.topStart,
              child: Text("Categorys",style: TextStyle(fontWeight: FontWeight.bold),)),
          verticalSpace(10),
          BlocBuilder<HomeCubit,HomeState>(
            builder: (context, state){
              if(state is HomeLoading){
                return SizedBox(
                  height: 100.h,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.45,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return  Shimmerlist();
                    },
                  ),
                );
              }
              if(state is HomeLoaded){
                return SizedBox(
                  height: 100.h,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.45,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.category.length,
                    itemBuilder: (context, index) {
                      return  CategoryCard(category: state.category[index]);
                    },
                  ),
                );
              }
              return const Center(
                  child: Text("Error"),
              ); }
            ),
        ],
      ),
    );
  }

}