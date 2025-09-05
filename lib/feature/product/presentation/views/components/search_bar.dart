import '../../../../../core/resources/app_imports.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Container(
        width: 68.w,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: ColorManager.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "...البحث بالمنطقة، المشروع",
            hintStyle: TextStyle(
              fontSize: 14.px,
              fontFamily: "KFNL",
              // ignore: deprecated_member_use
              color: ColorManager.white.withOpacity(0.7),
            ),
            suffixIcon: SvgPicture.asset(
              AppSvgAssetsManager.searchIcon,
              fit: BoxFit.scaleDown,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 2.h),
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
