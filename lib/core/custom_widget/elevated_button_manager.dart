import 'package:responsive_sizer/responsive_sizer.dart';
import '../resources/app_color_manager.dart';
import 'package:flutter/material.dart';
import 'app_text_manager.dart';

class ElevatedButtonManager extends StatelessWidget {
  const ElevatedButtonManager({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
  });

  final String text;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorManager.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 5.5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.w),
            ),
          ),
          onPressed: onPressed,
          child: AppText(
            text: text,
            fontWeight: FontWeight.bold,
            fontSize: 18.px,
            fontFamily: "Lato",
            textColor: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
