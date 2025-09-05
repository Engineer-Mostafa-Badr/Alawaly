import 'package:alawaly_app/core/resources/app_imports.dart';

class SearchCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SearchCardWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 17.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 90, 54, 54),
            Color.fromARGB(255, 112, 105, 103),
            Color.fromARGB(158, 43, 40, 40),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                text: 'فيلا',
                fontSize: 16.px,
                fontFamily: "EffraTrial",
                fontWeight: FontWeight.w600,
                textColor: ColorManager.white,
              ),
              SizedBox(width: 2.w),
              Container(
                height: 4.h,
                width: 10.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: ColorManager.starRateColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.5.w),
                  child: SvgPicture.asset(AppSvgAssetsManager.homeIcon2),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w, bottom: 1.h),
            child: AppText(
              text: 'فيلا • 5 غرف • الرياض • 1,000,000 - 2,000,000',
              fontSize: 14.px,
              fontFamily: "EffraTrial",
              fontWeight: FontWeight.w500,
              textColor: ColorManager.white,
            ),
          ),
          SizedBox(height: .5.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.white, width: 0.5.w),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Center(
                child: AppText(
                  text: 'مواصلة البحث',
                  fontSize: 16,
                  textColor: ColorManager.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "EffraTrial",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
