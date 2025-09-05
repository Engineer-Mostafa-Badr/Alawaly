import 'package:alawaly_app/core/resources/app_imports.dart';

/// Home banner card used in the carousel
class HomeBannerCard extends StatelessWidget {
  final String image;
  const HomeBannerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
