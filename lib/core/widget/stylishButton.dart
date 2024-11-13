import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylishecommerce/core/utils/colors.dart';

class StylishButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  const StylishButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).elevatedButtonTheme.style ??
      ElevatedButton.styleFrom(
        backgroundColor: ColorsMang.stylishRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
    );
        return SizedBox(
          width: 317.w,
          height: 55.h,
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: Text(text,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 20.sp),),
          ),
        );
  }

}