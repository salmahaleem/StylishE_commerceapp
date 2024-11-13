import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylishecommerce/core/utils/navigation.dart';

import '../../core/utils/routes/routes_pages.dart';
import '../../generated/assets.dart';

class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),(){
      context.pushReplacementNamed(RoutesPages.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(Assets.imagesStylishlogo),
        ),
      ),
    );
  }
}