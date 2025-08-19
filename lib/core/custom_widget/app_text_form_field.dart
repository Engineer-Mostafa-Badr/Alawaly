import 'package:responsive_sizer/responsive_sizer.dart';
import '../resources/app_color_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    this.colorHintText,
    this.hinText,
    this.labelText,
    this.isFill = true,
    this.validate,
    this.suffix,
    this.prefix,
    this.horizentalPadding,
    this.verticalPadding,
    this.isShowContent = false,
    this.keyboardType,
    this.colorLableText,
    this.inputFormatters,
    this.vertical,
    this.horizontal,
    this.hintTextSize,
    this.labelTextSize,
    this.hintTextWeight,
    this.labelTextWeight,
  });

  final TextEditingController textEditingController;
  final Color? colorHintText;
  final Color? colorLableText;
  final String? hinText;
  final String? labelText;
  final bool isFill;
  final String? Function(String? text)? validate;
  final Widget? suffix;
  final Widget? prefix;
  final double? horizentalPadding;
  final double? verticalPadding;
  final bool isShowContent;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double? vertical;
  final double? horizontal;
  final double? hintTextSize;
  final double? labelTextSize;
  final FontWeight? hintTextWeight;
  final FontWeight? labelTextWeight;

  InputBorder border({
    bool isErrorBorder = false,
    required BuildContext context,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(3.w),
    borderSide: BorderSide(
      color: isErrorBorder ? ColorManager.red : ColorManager.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 0.w,
        vertical: verticalPadding ?? 1.h,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textEditingController,
        validator: validate,
        obscureText: isShowContent,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hinText,
          hintStyle: TextStyle(
            color: colorHintText ?? ColorManager.greyLabelText,
            fontSize: hintTextSize ?? 14.px,
            fontWeight: hintTextWeight ?? FontWeight.w400,
            fontFamily: "EffraTrial",
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: colorLableText ?? ColorManager.grey,
            fontSize: labelTextSize ?? 14.px,
            fontWeight: labelTextWeight ?? FontWeight.w400,
          ),
          filled: isFill,
          errorMaxLines: 2,
          fillColor: ColorManager.greyTextFormField,
          enabledBorder: border(context: context),
          focusedBorder: border(context: context),
          border: border(context: context),
          errorBorder: border(isErrorBorder: true, context: context),
          contentPadding: EdgeInsets.symmetric(
            vertical: vertical ?? 1.5.h,
            horizontal: horizontal ?? 3.w,
          ),
        ),
      ),
    );
  }
}
