import '../../../../../core/resources/app_imports.dart';

class PageSwitcher extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIconTap;

  const PageSwitcher({
    super.key,
    required this.currentIndex,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 5.5.h,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SwitcherIcon(
            index: 0,
            isSelected: currentIndex == 0,
            asset: AppSvgAssetsManager.simplificationIcon,
            onTap: onIconTap,
          ),
          SizedBox(width: 2.w),
          _SwitcherIcon(
            index: 1,
            isSelected: currentIndex == 1,
            asset: AppSvgAssetsManager.simplificationIcon,
            onTap: onIconTap,
          ),
        ],
      ),
    );
  }
}

class _SwitcherIcon extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String asset;
  final Function(int) onTap;

  const _SwitcherIcon({
    required this.index,
    required this.isSelected,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: SvgPicture.asset(
          asset,
          width: 4.w,
          height: 6.w,
          fit: BoxFit.scaleDown,
          // ignore: deprecated_member_use
          color: isSelected ? ColorManager.primaryColor : Colors.white,
        ),
      ),
    );
  }
}
