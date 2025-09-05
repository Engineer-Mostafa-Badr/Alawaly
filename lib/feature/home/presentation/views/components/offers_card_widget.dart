import 'package:alawaly_app/core/resources/app_imports.dart';

class OfferCardWidget extends StatelessWidget {
  final String imageUrl;
  final String badgeText;
  final String title;
  final String subtitle;
  final String untilText;

  const OfferCardWidget({
    super.key,
    required this.imageUrl,
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.untilText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 16.h,
      margin: EdgeInsets.only(left: 1.w, right: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        // ignore: deprecated_member_use
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4B3226), // Top
            Color.fromARGB(255, 110, 106, 104), // Middle
            Color.fromARGB(255, 197, 194, 194), // Bottom
          ],
        ),
      ),
      child: Stack(
        children: [
          Image.asset(imageUrl, height: 18.h, width: 45.w, fit: BoxFit.cover),
          Positioned(
            right: 4.w,
            top: 1.2.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    color: ColorManager.primaryColor,
                  ),
                  child: AppText(
                    text: badgeText,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    textColor: ColorManager.white,
                    fontFamily: "Tajawal",
                  ),
                ),
                SizedBox(height: .5.h),
                AppText(
                  text: title,
                  fontSize: 20.px,
                  fontWeight: FontWeight.w700,
                  textColor: ColorManager.white,
                  fontFamily: "Tajawal",
                ),
                SizedBox(height: .5.h),
                AppText(
                  text: subtitle,
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                  textColor: ColorManager.white,
                  fontFamily: "Tajawal",
                ),
                SizedBox(height: .5.h),
                Row(
                  children: [
                    AppText(
                      text: untilText,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                      textColor: ColorManager.white,
                      fontFamily: "EffraTrial",
                    ),
                    SizedBox(width: 1.w),
                    SvgPicture.asset(
                      AppSvgAssetsManager.clockIcon,
                      height: 2.h,
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
