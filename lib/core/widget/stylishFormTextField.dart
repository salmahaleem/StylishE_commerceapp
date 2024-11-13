import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class StylishFormTextField extends StatelessWidget{
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final Widget? suffixIcon;


  final String? Function(String?)? validator;

  const StylishFormTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isObscureText,
    this.suffixIcon,
    this.validator,

  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
     decoration: InputDecoration(
       border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.r),
             borderSide: BorderSide(color: ColorsMang.borderInField),
         ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8.r),
         borderSide: BorderSide(color: ColorsMang.stylishRed),
       ),
       contentPadding: EdgeInsets.symmetric(
         vertical: 20.h,
         horizontal: 16.w,
       ),
       hintText: hintText,
       hintStyle: Theme.of(context).textTheme.titleLarge,
       suffixIcon: suffixIcon,
       filled: true,
       fillColor: ColorsMang.backgroundTextField,
     ),
      controller: controller,
      validator: validator,
      obscureText: isObscureText,



    );
  }

}