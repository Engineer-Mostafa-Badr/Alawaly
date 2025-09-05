import 'package:alawaly_app/core/resources/app_imports.dart';

/// ----------------------------
/// Custom Bottom Navigation
/// ----------------------------
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  // visual constants
  final double circleRadius = 30;
  final Color circleColor = ColorManager.lightGrey;
  final Color iconSelectedColor = ColorManager.white;
  final double iconSelectedSize = 28;
  final double iconUnselectedSize = 22;
  final double circleElevation = 6;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  static const List<String> _labels = [
    'المزيد',
    'حسابي',
    'المفضلة',
    'العقارات',
    'الرئيسية',
  ];

  static const List<String> _iconPaths = [
    AppSvgAssetsManager.moreIcon,
    AppSvgAssetsManager.profileIcon,
    AppSvgAssetsManager.heartIcon,
    AppSvgAssetsManager.simplificationIcon,
    AppSvgAssetsManager.homeIcon,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / _labels.length;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // background painter
        CustomPaint(
          size: Size(screenWidth, 10.h),
          painter: BottomNavPainter(currentIndex, circleRadius),
        ),

        // icons row
        SizedBox(
          height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_labels.length, (index) {
              final isSelected = currentIndex == index;
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 1.2.h),
                    if (!isSelected) ...[
                      SvgPicture.asset(
                        _iconPaths[index],
                        // ignore: deprecated_member_use
                        color: ColorManager.grey,
                        height: iconUnselectedSize,
                      ),
                      SizedBox(height: 1.h),
                      AppText(
                        fontSize: 12.px,
                        textColor: ColorManager.grey,
                        text: _labels[index],
                      ),
                    ],
                    SizedBox(height: 2.h),
                  ],
                ),
              );
            }),
          ),
        ),

        // selected circular icon + label
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: -circleRadius / 1,
          left: itemWidth * currentIndex + itemWidth / 2 - circleRadius,
          child: Column(
            children: [
              Material(
                elevation: circleElevation,
                shape: const CircleBorder(),
                color: circleColor,
                child: Container(
                  height: circleRadius * 2,
                  width: circleRadius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      _iconPaths[currentIndex],
                      // ignore: deprecated_member_use
                      color: iconSelectedColor,
                      height: iconSelectedSize,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),
              AppText(
                text: _labels[currentIndex],
                fontSize: 15.px,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Painter for the bottom navigation's background with a circular cutout.
class BottomNavPainter extends CustomPainter {
  final int currentIndex;
  final double circleRadius;
  BottomNavPainter(this.currentIndex, this.circleRadius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorManager.containerGray
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 50, 0, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final itemWidth = size.width / 5;
    final centerX = itemWidth * currentIndex + itemWidth / 2;
    final cutout = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(centerX, -1), radius: circleRadius + 8),
      );

    final finalPath = Path.combine(PathOperation.difference, path, cutout);

    canvas.drawShadow(finalPath, ColorManager.black, 6, true);
    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(covariant BottomNavPainter oldDelegate) {
    return oldDelegate.currentIndex != currentIndex ||
        oldDelegate.circleRadius != circleRadius;
  }
}
