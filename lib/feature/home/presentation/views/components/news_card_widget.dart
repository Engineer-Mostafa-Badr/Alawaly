import 'package:alawaly_app/core/resources/app_imports.dart';

class NewsCardWidget extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String bottomTitle;
  final String imageUrl;
  final String date;

  // TODO: Here You Must Using Object. becouse Parameters gt 3.
  /**
  in feature/home/models/[Model Name].dart
  add class [Model Name].
  2. instance of [Model Name] Is Param Here.
  Like that ->

  `
  final [Model Name] newsItem;
  const NewsCardWidget({
    super.key,
    this.unitInfo = newsItem,
   
  });
  `
   */
  const NewsCardWidget({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.imageUrl,
    required this.date,
    this.bottomTitle = 'عرض التفاصيل',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 14.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 36, 33, 31), // Top
            Color.fromARGB(255, 128, 118, 113), // Middle
            Color.fromARGB(255, 31, 29, 29), // Bottom
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // TODO: Use Theme Data To get Font Size, Font Weight and Font Family.
                // Why: Maybe The Font Will By Change And Font Size From Mobile Setting. this not Prodactive Way To Create App.
                // Theme.of(context).TextTheme..[Large, medim,small.......].
                // or Theme.of(context).TextTheme.CopyWith(.....)..[Large, medim,small.......].
                AppText(
                  text: title,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w800,
                  textColor: ColorManager.white,
                  fontFamily: "EffraTrial",
                ),
                SizedBox(height: 1.h),
                AppText(
                  text: subtitle1,
                  fontSize: 14.px,
                  fontWeight: FontWeight.w400,
                  textColor: ColorManager.white,
                  fontFamily: "EffraTrial",
                ),
                SizedBox(height: .3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteName.viewDetailsRoute,
                        );
                      },
                      child: AppText(
                        text: bottomTitle,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        textColor: ColorManager.appBarColor,
                        fontFamily: "EffraTrial",
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                    AppText(
                      text: subtitle2,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                      textColor: ColorManager.white,
                      fontFamily: "EffraTrial",
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      text: date,
                      fontSize: 12.px,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.white,
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
          SizedBox(width: 3.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(2.w),
            child: Image.asset(
              imageUrl,
              height: 14.h,
              width: 22.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
