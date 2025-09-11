import '../../../../../core/resources/app_imports.dart';

class GradientImageOverlay extends StatelessWidget {
  final String imagePath;
  final Gradient? gradient;
  final bool showOverlay;
  final double? imageHeight;
  final double? containerHeight;
  final double? borderRadius;

  const GradientImageOverlay({
    super.key,
    required this.imagePath,
    this.gradient,
    this.showOverlay = false,
    this.imageHeight,
    this.borderRadius,
    this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 4.w),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: imageHeight ?? 15.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          if (showOverlay == true)
            Container(
              height: containerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: gradient ?? ColorManager.cardBackground,
              ),
            ),
        ],
      ),
    );
  }
}
