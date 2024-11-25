import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext{

  Future<dynamic>pushReplacementNamed(String routeName)
  {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments})
  {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

}