import 'package:alawaly_app/core/resources/app_imports.dart';

class SectionsHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Color color;
  final bool showUnderline;

  const SectionsHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.color = ColorManager.appBarColor,
    this.showUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (actionText != null && onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: AppText(
                text: actionText!,
                fontSize: 14.px,
                fontFamily: "EffraTrial",
                fontWeight: FontWeight.w400,
                textColor: color,
                textDecoration: TextDecoration.underline,
              ),
            ),
          if (actionText != null && onActionTap != null) const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                text: title,
                fontSize: 16.px,
                fontWeight: FontWeight.w500,
                textColor: ColorManager.white,
                fontFamily: "EffraTrial",
              ),
              if (showUnderline) SizedBox(height: .75.h),
              if (showUnderline)
                Container(height: .35.h, width: 18.w, color: color),
            ],
          ),
        ],
      ),
    );
  }
}
