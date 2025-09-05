import 'package:alawaly_app/core/resources/app_imports.dart';

class UnitCardWidget extends StatelessWidget {
  // Make this reusable by allowing most properties to be injected later
  final String imagePath;
  final bool isFavorite;
  final String badgeText;
  final String title;
  final String address;
  final String unitType;
  final String baths;
  final String rooms;
  final String area;
  final String price;

  const UnitCardWidget({
    super.key,
    this.imagePath = AppAssetsManager.imgPhoto,
    this.isFavorite = false,
    this.badgeText = 'وحدات جاهزه',
    this.title = 'فيلا دوبلكس - العوالي رايز',
    this.address = 'عنوان الوحده بالتفصيل',
    this.unitType = 'سكني',
    this.baths = '3 حمام',
    this.rooms = '3 غرف',
    this.area = '112 م²',
    this.price = '25,000',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      margin: EdgeInsets.only(right: 3.w),
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(2.w)),
            child: Padding(
              padding: EdgeInsets.all(1.7.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.w),
                    child: Image.asset(
                      imagePath,
                      height: 16.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 4.w,
                    top: 1.5.h,
                    child: Container(
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: ColorManager.grey2.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.5.w),
                        child: SvgPicture.asset(
                          AppSvgAssetsManager.heartIcon,
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
                              text: badgeText,
                              fontFamily: "EffraTrial",
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                              textColor: ColorManager.white,
                            ),
                          ),
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
                    textColor: ColorManager.white,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w400,
                    fontFamily: "EffraTrial",
                    text: title,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      textColor: ColorManager.white,
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
                    Row(
                      children: [
                        AppText(
                          textColor: ColorManager.white,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          fontFamily: "EffraTrial",
                          text: unitType,
                        ),
                        SizedBox(width: 1.w),
                        SvgPicture.asset(
                          AppSvgAssetsManager.tagIcon,
                          height: 1.7.h,
                        ),
                      ],
                    ),
                    SizedBox(width: 1.h),
                    Row(
                      children: [
                        AppText(
                          textColor: ColorManager.white,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          fontFamily: "EffraTrial",
                          text: baths,
                        ),
                        SizedBox(width: 1.w),
                        SvgPicture.asset(
                          AppSvgAssetsManager.tagIcon,
                          height: 1.7.h,
                        ),
                      ],
                    ),
                    SizedBox(width: 1.h),
                    Row(
                      children: [
                        AppText(
                          textColor: ColorManager.white,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          fontFamily: "EffraTrial",
                          text: rooms,
                        ),
                        SizedBox(width: 1.w),
                        SvgPicture.asset(
                          AppSvgAssetsManager.tagIcon,
                          height: 1.7.h,
                        ),
                      ],
                    ),
                    SizedBox(width: 1.h),
                    Row(
                      children: [
                        AppText(
                          textColor: ColorManager.white,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w500,
                          fontFamily: "EffraTrial",
                          text: area,
                        ),
                        SizedBox(width: 1.w),
                        SvgPicture.asset(
                          AppSvgAssetsManager.tagIcon,
                          height: 1.7.h,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppSvgAssetsManager.reyalIcon),
                    SizedBox(width: 1.w),
                    AppText(
                      textColor: ColorManager.starRateColor,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: "EffraTrial",
                      text: price,
                    ),
                    SizedBox(width: 1.w),
                    AppText(
                      textColor: ColorManager.white,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: "EffraTrial",
                      text: "تبدء من ",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
