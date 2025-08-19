import 'package:alawaly_app/core/custom_widget/app_text_form_field.dart';
import 'package:alawaly_app/core/custom_widget/app_text_manager.dart';
import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/resources/app_color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssetsManager.signUpPhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          text: 'English',
                          textColor: ColorManager.black,
                          fontFamily: "EffraTrial",
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.language, size: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.w),
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.w),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 15),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 5.h,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 6.h),
                            AppText(
                              text: "نسعى لبناء بيئات معيشية متكاملة",
                              textAlign: TextAlign.center,
                              fontSize: 18.px,
                              fontFamily: "EffraTrial",
                              fontWeight: FontWeight.w700,
                              textColor: ColorManager.white,
                            ),
                            SizedBox(height: 2.h),
                            AppText(
                              text:
                                  "نحن في العوالي نجمع بين أصالة التقاليد وحداثة الحياة العصرية، لبناء وتطوير بيئات معيشية تتناسب مع تطلعاتكم وتلائم المستقبل.",
                              fontSize: 16.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: "EffraTrial",
                              textColor: ColorManager.white,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 3.h),
                            AppText(
                              text: "نحتاج لرقم جوالك لبدء رحلتك",
                              fontFamily: "EffraTrial",
                              fontSize: 16.px,
                              fontWeight: FontWeight.w500,
                              textColor: ColorManager.white,
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.greyTextFormField,
                                    border: Border.all(
                                      color: ColorManager.white,
                                    ),
                                    borderRadius: BorderRadius.circular(3.w),
                                  ),
                                  child: AppText(
                                    text: "+966",
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w500,
                                    textColor: ColorManager.grey2,
                                    fontFamily: "EffraTrial",
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: AppTextFormField(
                                    hinText: "ادخل رقم الجوال",
                                    hintTextSize: 16.px,
                                    hintTextWeight: FontWeight.w500,
                                    keyboardType: TextInputType.number,
                                    colorHintText: ColorManager.grey2,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textEditingController:
                                        TextEditingController(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: AppText(
                                  textColor: ColorManager.white,
                                  fontSize: 16.px,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "EffraTrial",
                                  text: 'التالي',
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PageRouteName.homeRoute,
                                );
                              },
                              child: AppText(
                                text: "استكمل كزائر",
                                fontSize: 16.px,
                                fontFamily: "EffraTrial",
                                fontWeight: FontWeight.w500,
                                textColor: ColorManager.white,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
