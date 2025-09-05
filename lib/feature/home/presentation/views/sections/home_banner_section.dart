import '../../../../../core/resources/app_imports.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/home_banner_card.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [HomeBannerCard(image: AppAssetsManager.untitledPhoto)],
      options: CarouselOptions(
        height: 19.h,
        viewportFraction: 0.9,
        autoPlay: false,
      ),
    );
  }
}
