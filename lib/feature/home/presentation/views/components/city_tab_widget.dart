import 'package:alawaly_app/core/resources/app_imports.dart';

/// Reusable small widgets moved into classes
class CityTabWidget extends StatelessWidget {
  final String title;
  final bool selected;
  const CityTabWidget({super.key, required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
      decoration: BoxDecoration(
        color: selected ? ColorManager.primaryColor : ColorManager.grey2,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Center(
        child: AppText(
          text: title,
          fontSize: 14.px,
          textColor: ColorManager.white,
          fontFamily: "EffraTrial",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
