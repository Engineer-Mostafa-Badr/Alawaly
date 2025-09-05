import '../../../../../core/resources/app_imports.dart';

class FloatingActions extends StatelessWidget {
  final List<FloatingButtonData> buttons;

  const FloatingActions({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: buttons.map((btn) => _FloatingButton(data: btn)).toList(),
    );
  }
}

class FloatingButtonData {
  final double left;
  final double right;
  final String icon;
  final String? label;
  final VoidCallback? onTap;

  FloatingButtonData({
    required this.left,
    required this.right,
    required this.icon,
    this.label,
    this.onTap,
  });
}

class _FloatingButton extends StatelessWidget {
  final FloatingButtonData data;

  const _FloatingButton({required this.data});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: data.left,
      right: data.right,
      bottom: 15.h,
      child: GestureDetector(
        onTap: data.onTap,
        child: Container(
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: ColorManager.appBarColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.label != null)
                AppText(
                  text: data.label!,
                  fontFamily: "EffraTrial",
                  fontSize: 16.px,
                  fontWeight: FontWeight.w500,
                  textColor: ColorManager.white,
                ),
              if (data.label != null) SizedBox(width: 4.w),
              // ignore: deprecated_member_use
              SvgPicture.asset(data.icon, color: ColorManager.white),
            ],
          ),
        ),
      ),
    );
  }
}
