import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';
import 'package:stylishecommerce/core/utils/routes/routes_pages.dart';
import 'package:stylishecommerce/feature/home/logic/home_cubit.dart';
import 'package:stylishecommerce/feature/home/product/logic/products_cubit.dart';
import 'package:stylishecommerce/feature/home/ui/widget/category_list/category.dart';
import 'package:stylishecommerce/feature/home/ui/widget/limitProductsHomeList.dart';
import 'package:stylishecommerce/feature/home/ui/widget/searchBar.dart';
import 'package:stylishecommerce/feature/home/ui/widget/sideBarWidget.dart';
import 'package:stylishecommerce/feature/home/ui/widget/swipercard.dart';

import '../../../core/network_service/gititdio.dart';
import '../../../core/utils/spacing.dart';
import '../../../generated/assets.dart';
import 'widget/category_list/fillterbar.dart';

class HomePage extends StatelessWidget{
  final SidebarXController drawerCont = SidebarXController(selectedIndex: 0,extended: true);
  final _key = GlobalKey<ScaffoldState>();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<HomeCubit>(),
        ),
        BlocProvider.value(
          value: getIt<ProductsCubit>(),
        ),
      ],
  child: Scaffold(
      key: _key,
      appBar: isSmallScreen ? AppBar(
        leading: IconButton(onPressed:(){
          _key.currentState?.openDrawer();
        },icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Image.asset(
          Assets.imagesStylishlogo,
          height: 80.h,width: 80.w,
        ),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(RoutesPages.profile);
          }, icon: Icon(Icons.person))
        ],
      ):null,
      drawer: SideBarWidget (sideController:  drawerCont),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarwedgit(),
              verticalSpace(20),
              Fillterbar(),
              verticalSpace(10),
              CategoryList(),
              verticalSpace(8),
              HomeSwiperCard(),
              verticalSpace(15),
              LimitProductsHomeList()
            ],
          )),


    ),
);
  }

}