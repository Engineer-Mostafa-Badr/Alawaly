import 'package:alawaly_app/core/custom_widget/app_text_manager.dart';
import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/resources/app_color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final String status;
  final String city;
  final String price;
  final String projectName;
  final String address;
  final String deliveryDate;
  final List<String> unitTypes;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.isFavorite,
    required this.status,
    required this.city,
    required this.price,
    required this.projectName,
    required this.address,
    required this.deliveryDate,
    required this.unitTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 14, 13, 13),
            Color.fromARGB(255, 88, 83, 81),
            Color.fromARGB(255, 56, 37, 30),
          ],
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(4.w)),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.w),
                    child: Image.asset(
                      imagePath,
                      height: 15.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 4.w,
                    top: 1.5.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.5.w),
                        child: SvgPicture.asset(
                          isFavorite
                              ? AppSvgAssetsManager.heart2Icon
                              : AppSvgAssetsManager.heart2Icon,
                          height: 3.h,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 4.w,
                    top: 2.h,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: ColorManager.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 0.5.h,
                            ),
                            child: AppText(
                              text: status,
                              fontFamily: "EffraTrial",
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                              textColor: ColorManager.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.grey,
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 0.5.h,
                            ),
                            child: Row(
                              children: [
                                AppText(
                                  text: city,
                                  fontFamily: "EffraTrial",
                                  fontSize: 14.px,
                                  fontWeight: FontWeight.w400,
                                  textColor: ColorManager.white,
                                ),
                                SizedBox(width: 2.w),
                                SvgPicture.asset(
                                  AppSvgAssetsManager.locationIcon,
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 7.w,
                    bottom: 3.h,
                    child: Column(
                      children: [
                        AppText(
                          text: "يبدء من ",
                          fontFamily: "EffraTrial",
                          fontSize: 14.px,
                          fontWeight: FontWeight.w400,
                          textColor: ColorManager.white,
                        ),
                        AppText(
                          text: price,
                          fontFamily: "EffraTrial",
                          fontSize: 18.px,
                          fontWeight: FontWeight.w600,
                          textColor: ColorManager.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    textColor: Colors.white,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w400,
                    fontFamily: "EffraTrial",
                    text: projectName,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      textColor: Colors.white,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: "EffraTrial",
                      text: address,
                    ),
                    SizedBox(width: 1.w),
                    SvgPicture.asset(
                      AppSvgAssetsManager.locationIcon,
                      height: 1.7.h,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      textColor: Colors.white,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: "EffraTrial",
                      text: "موعد التسليم: $deliveryDate",
                    ),
                    SizedBox(width: 1.w),
                    SvgPicture.asset(
                      AppSvgAssetsManager.clockIcon,
                      height: 1.7.h,
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    String? unit = index < unitTypes.length
                        ? unitTypes[index]
                        : null;
                    return Container(
                      margin: EdgeInsets.only(left: 1.w),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: ColorManager.greyLabelText.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(1.8.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.5.h,
                        ),
                        child: Row(
                          children: [
                            AppText(
                              text: unit ?? "استوديو",
                              fontFamily: "EffraTrial",
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                              textColor: ColorManager.white,
                            ),
                            SizedBox(width: 1.w),
                            SvgPicture.asset(
                              AppSvgAssetsManager.simplificationIcon,
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
