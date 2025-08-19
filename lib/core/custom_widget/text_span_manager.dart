import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanManager extends StatelessWidget {
  const TextSpanManager({
    super.key,
    required this.textOne,
    this.textTwo,
    this.onTap,
    this.fontFamilyTextOne,
    this.fontFamilyTextTwo,
    this.colorTextOne,
    this.colorTextTwo,
    this.fontSizeTextOne,
    this.fontWeightTextOne,
    this.fontSizeTextTwo,
    this.fontWeightTextTwo,
    this.latterSpaceTextOne,
    this.latterSpaceTextTwo,
    this.textAlign,
  });

  final String textOne;
  final String? textTwo;
  final String? fontFamilyTextOne;
  final String? fontFamilyTextTwo;
  final Color? colorTextOne;
  final Color? colorTextTwo;
  final double? fontSizeTextOne;
  final double? fontSizeTextTwo;
  final FontWeight? fontWeightTextOne;
  final FontWeight? fontWeightTextTwo;
  final double? latterSpaceTextOne;
  final double? latterSpaceTextTwo;
  final Function(String)? onTap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: textOne,
        style: TextStyle(
          color: colorTextOne,
          fontSize: fontSizeTextOne,
          fontWeight: fontWeightTextOne,
          fontFamily: fontFamilyTextOne,
          letterSpacing: latterSpaceTextOne,
        ),
        children: [
          TextSpan(
            text: textTwo,
            style: TextStyle(
              color: colorTextTwo,
              fontSize: fontSizeTextTwo ?? 16.px,
              fontWeight: fontWeightTextTwo,
              fontFamily: fontFamilyTextOne,
              letterSpacing: latterSpaceTextTwo,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap?.call(textTwo ?? '');
              },
          ),
        ],
      ),
    );
  }
}
