import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/custom_widget/gradient_image_overlay.dart';
import '../../../../../core/resources/app_imports.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeHeaderWithBanner extends StatefulWidget {
  const HomeHeaderWithBanner({super.key});

  @override
  State<HomeHeaderWithBanner> createState() => _HomeHeaderWithBannerState();
}

class _HomeHeaderWithBannerState extends State<HomeHeaderWithBanner> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Stack(
        children: [
          Positioned.fill(
            top: 3.h,
            child: SvgPicture.asset(
              AppSvgAssetsManager.lineIcon,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              PageRouteName.profileRoute,
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            child: SvgPicture.asset(
                              AppSvgAssetsManager.profileIcon,
                              height: 2.5.h,
                              // ignore: deprecated_member_use
                              color: ColorManager.grey2,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.3.w,
                            vertical: 0.6.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: const Color.fromARGB(255, 80, 78, 78),
                          ),
                          child: SvgPicture.asset(
                            AppSvgAssetsManager.notificationIcon,
                            height: 3.h,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      AppSvgAssetsManager.homeLogo,
                      height: 7.h,
                      width: 10.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Column(
                children: [
                  SizedBox(
                    height: 19.h,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 25.h,
                          child: Stack(
                            children: [
                              CarouselSlider(
                                items: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: GradientImageOverlay(
                                      imagePath: AppAssetsManager.homePhoto,
                                      showOverlay: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: GradientImageOverlay(
                                      imagePath: AppAssetsManager.homePhoto,
                                      showOverlay: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: GradientImageOverlay(
                                      imagePath: AppAssetsManager.homePhoto,
                                      showOverlay: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: GradientImageOverlay(
                                      imagePath: AppAssetsManager.homePhoto,
                                      showOverlay: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    child: GradientImageOverlay(
                                      imagePath: AppAssetsManager.homePhoto,
                                      showOverlay: true,
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  height: 20.h,
                                  viewportFraction: 0.75,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() => activeIndex = index);
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: activeIndex,
                                    count: 3,
                                    effect: ScrollingDotsEffect(
                                      activeDotColor: Colors.white,
                                      // ignore: deprecated_member_use
                                      dotColor: ColorManager.white.withOpacity(
                                        0.3,
                                      ),
                                      dotHeight: 5,
                                      dotWidth: 13,
                                      spacing: 8,
                                      paintStyle: PaintingStyle.fill,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
