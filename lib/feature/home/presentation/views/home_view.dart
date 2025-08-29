import 'package:alawaly_app/feature/product/presentation/views/products_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/favorite_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/profile_view.dart';
import 'package:alawaly_app/core/custom_widget/app_text_manager.dart';
import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/resources/app_color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 4;

  final List<Widget> _pages = const [
    MorePage(),
    ProfileView(),
    FavoriteView(),
    ProductsView(),
    HomeContent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3b2a1a),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff3b2a1a),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgAssetsManager.moreIcon),
            label: "المزيد",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgAssetsManager.profileIcon),
            label: "حسابي",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgAssetsManager.heartIcon),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgAssetsManager.simplificationIcon),
            label: "العقارات",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgAssetsManager.homeIcon),
            label: "الرئيسية",
          ),
        ],
      ),
    );
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "صفحة المزيد",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
                          vertical: 0.5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade700,
                        ),
                        child: SvgPicture.asset(
                          AppSvgAssetsManager.notificationIcon,
                          height: 3.h,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppSvgAssetsManager.alawalyLogo,
                    height: 6.h,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage(AppAssetsManager.untitledPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Text(
                      "",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180,
                viewportFraction: 0.9,
                autoPlay: false,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: AppText(
                    text: " عرض الكل",
                    fontFamily: "EffraTrial",
                    fontSize: 14.px,
                    textColor: ColorManager.appBarColor,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSectionTitle("أحدث مشاريعنا"),
                    SizedBox(height: .75.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: .35.h,
                        width: 18.w,
                        color: ColorManager.appBarColor,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  reverse: true,
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCityTab("المدينة (12)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("جدة (81)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("الرياض (8)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("كل المدن", true),
                        SizedBox(width: 2.w),
                        _buildCityTab("المدينة (12)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("جدة (81)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("الرياض (8)", false),
                        SizedBox(width: 2.w),
                        _buildCityTab("كل المدن", true),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 1.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.productDetailsRoute);
              },
              child: SizedBox(
                height: 33.h,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => _buildProjectCard(),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: AppText(
                    text: "جميع العقارات",
                    fontFamily: "EffraTrial",
                    fontSize: 14.px,
                    textColor: ColorManager.appBarColor,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSectionTitle("الوحدات المميزة"),
                    SizedBox(height: .75.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: .35.h,
                        width: 18.w,
                        color: ColorManager.appBarColor,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.unitDetailsRoute);
              },
              child: SizedBox(
                height: 33.h,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => _buildUnitCard(),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: AppText(
                    text: "جميع الاخبار",
                    fontFamily: "EffraTrial",
                    fontSize: 14.px,
                    textColor: ColorManager.appBarColor,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSectionTitle("آخر الاخبار"),
                    SizedBox(height: .75.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: .35.h,
                        width: 18.w,
                        color: ColorManager.appBarColor,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            _buildNewsCard(
              "إطلاق المرحلة الثانية من مشروع الواحة",
              "تقرير جديد يكشف ارتفاع عدد المشاريع تحت الإنشاء\n وزيادة الإقبال على الوحدات الجاهزة.. عرض التفاصيل",
              AppAssetsManager.framePhoto,
            ),
            _buildNewsCard(
              "شراكة جديدة مع بنك الإسكان",
              "تقرير جديد يكشف ارتفاع عدد المشاريع تحت الإنشاء\n وزيادة الإقبال على الوحدات الجاهزة.. عرض التفاصيل",
              AppAssetsManager.frame2Photo,
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: AppText(
                    text: "جميع العروض",
                    fontFamily: "EffraTrial",
                    fontSize: 14.px,
                    textColor: ColorManager.appBarColor,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSectionTitle("عروض تسويقية"),
                    SizedBox(height: .75.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: .35.h,
                        width: 18.w,
                        color: ColorManager.appBarColor,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h),
            _buildOfferCard(),
            SizedBox(height: 2.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildSectionTitle("استكمل بحثك السابق"),
                SizedBox(height: .75.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: .35.h,
                    width: 18.w,
                    color: ColorManager.appBarColor,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            _buildSearchCard(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.searchRoute);
              },
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}

Widget _buildCityTab(String title, bool selected) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
    decoration: BoxDecoration(
      color: selected ? ColorManager.primaryColor : Colors.grey.shade800,
      borderRadius: BorderRadius.circular(4.w),
    ),
    child: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget _buildProjectCard() {
  return Container(
    width: 90.w,
    margin: EdgeInsets.only(right: 4.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      color: Colors.grey.shade900,
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.w),
                  child: Image.asset(
                    AppAssetsManager.imgPhoto,
                    height: 15.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 4.w,
                  top: 1.5.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.grey,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.5.w),
                      child: SvgPicture.asset(
                        AppSvgAssetsManager.heart2Icon,
                        height: 3.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 4.w,
                  top: 2.h,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 0.5.h,
                          ),
                          child: AppText(
                            text: "تحت الانشاء",
                            fontFamily: "EffraTrial",
                            fontSize: 14.px,
                            fontWeight: FontWeight.w400,
                            textColor: ColorManager.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.grey,
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.5.h,
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: "الرياض",
                                fontFamily: "EffraTrial",
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,
                                textColor: ColorManager.white,
                              ),
                              SizedBox(width: 2.w),
                              SvgPicture.asset(
                                AppSvgAssetsManager.locationIcon,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: 7.w,
                  bottom: 3.h,
                  child: Column(
                    children: [
                      AppText(
                        text: "يبدء من ",
                        fontFamily: "EffraTrial",
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        textColor: ColorManager.white,
                      ),
                      AppText(
                        text: " 840 الف",
                        fontFamily: "EffraTrial",
                        fontSize: 16.px,
                        fontWeight: FontWeight.w700,
                        textColor: ColorManager.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  textColor: Colors.white,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w400,
                  fontFamily: "EffraTrial",
                  text: 'اسم المشروع',
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    textColor: Colors.white,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: "EffraTrial",
                    text: 'اسم الشارع - اسم الحي - اسم المدينه - اسم المنطقة',
                  ),
                  SizedBox(width: 1.w),
                  SvgPicture.asset(
                    AppSvgAssetsManager.locationIcon,
                    height: 1.7.h,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    textColor: Colors.white,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: "EffraTrial",
                    text: "موعد التسليم: 2028",
                  ),
                  SizedBox(width: 1.w),
                  SvgPicture.asset(
                    AppSvgAssetsManager.clockIcon,
                    height: 1.7.h,
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 0.5.h,
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: "استوديو",
                                fontFamily: "EffraTrial",
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,
                                textColor: ColorManager.white,
                              ),
                              SizedBox(width: 1.w),
                              SvgPicture.asset(
                                AppSvgAssetsManager.simplificationIcon,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: .5.h),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 0.5.h,
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: "استوديو",
                                fontFamily: "EffraTrial",
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,
                                textColor: ColorManager.white,
                              ),
                              SizedBox(width: 1.w),
                              SvgPicture.asset(
                                AppSvgAssetsManager.simplificationIcon,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: .5.h),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 0.5.h,
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: "استوديو",
                                fontFamily: "EffraTrial",
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,
                                textColor: ColorManager.white,
                              ),
                              SizedBox(width: 1.w),
                              SvgPicture.asset(
                                AppSvgAssetsManager.simplificationIcon,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: .5.h),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 0.5.h,
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: "استوديو",
                                fontFamily: "EffraTrial",
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,
                                textColor: ColorManager.white,
                              ),
                              SizedBox(width: 1.w),
                              SvgPicture.asset(
                                AppSvgAssetsManager.simplificationIcon,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildUnitCard() {
  return Container(
    width: 70.w,
    margin: EdgeInsets.only(right: 4.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      color: Colors.grey.shade900,
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.w),
                  child: Image.asset(
                    AppAssetsManager.imgPhoto,
                    height: 15.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 4.w,
                  top: 1.5.h,
                  child: Container(
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: ColorManager.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.5.w),
                      child: SvgPicture.asset(
                        AppSvgAssetsManager.heartIcon,
                        height: 3.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 4.w,
                  top: 2.h,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: ColorManager.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 0.5.h,
                          ),
                          child: AppText(
                            text: "وحدات جاهزه",
                            fontFamily: "EffraTrial",
                            fontSize: 14.px,
                            fontWeight: FontWeight.w400,
                            textColor: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  textColor: Colors.white,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w400,
                  fontFamily: "EffraTrial",
                  text: 'فيلا دوبلكس - العوالي رايز',
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    textColor: Colors.white,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: "EffraTrial",
                    text: "عنوان الوحده بالتفصيل",
                  ),
                  SizedBox(width: 1.w),
                  SvgPicture.asset(
                    AppSvgAssetsManager.locationIcon,
                    height: 1.7.h,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      AppText(
                        textColor: Colors.white,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w500,
                        fontFamily: "EffraTrial",
                        text: "سكني",
                      ),
                      SizedBox(width: 1.w),
                      SvgPicture.asset(
                        AppSvgAssetsManager.tagIcon,
                        height: 1.7.h,
                      ),
                    ],
                  ),
                  SizedBox(width: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        textColor: Colors.white,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w500,
                        fontFamily: "EffraTrial",
                        text: "3 حمام",
                      ),
                      SizedBox(width: 1.w),
                      SvgPicture.asset(
                        AppSvgAssetsManager.tagIcon,
                        height: 1.7.h,
                      ),
                    ],
                  ),
                  SizedBox(width: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        textColor: Colors.white,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w500,
                        fontFamily: "EffraTrial",
                        text: "3 غرف",
                      ),
                      SizedBox(width: 1.w),
                      SvgPicture.asset(
                        AppSvgAssetsManager.tagIcon,
                        height: 1.7.h,
                      ),
                    ],
                  ),
                  SizedBox(width: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        textColor: Colors.white,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w500,
                        fontFamily: "EffraTrial",
                        text: "112 م²",
                      ),
                      SizedBox(width: 1.w),
                      SvgPicture.asset(
                        AppSvgAssetsManager.tagIcon,
                        height: 1.7.h,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    textColor: ColorManager.primaryColor,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: "EffraTrial",
                    text: "25,000",
                  ),
                  SizedBox(width: 1.w),
                  AppText(
                    textColor: Colors.white,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    fontFamily: "EffraTrial",
                    text: "تبدء من ",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildNewsCard(String title, String subtitle, String imageUrl) {
  return Container(
    width: double.infinity,
    height: 14.h,
    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      color: Colors.grey.shade900,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              text: title,
              fontSize: 16.px,
              fontWeight: FontWeight.w800,
              textColor: Colors.white,
              fontFamily: "EffraTrial",
            ),
            SizedBox(height: 1.h),
            AppText(
              text: subtitle,
              fontSize: 14.px,
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
              fontFamily: "EffraTrial",
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                AppText(
                  text: "22 يناير 2024",
                  fontSize: 12.px,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                  fontFamily: "EffraTrial",
                ),
                SizedBox(width: 1.w),
                SvgPicture.asset(AppSvgAssetsManager.clockIcon, height: 2.h),
              ],
            ),
          ],
        ),
        SizedBox(width: 3.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(2.w),
          child: Image.asset(
            imageUrl,
            height: 14.h,
            width: 22.w,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget _buildOfferCard() {
  return Container(
    width: double.infinity,
    height: 16.h,
    margin: EdgeInsets.symmetric(horizontal: 4.w),
    // padding: EdgeInsets.all(3.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      // ignore: deprecated_member_use
      color: ColorManager.lightGrey.withOpacity(0.3),
    ),
    child: Stack(
      children: [
        Image.asset(
          AppAssetsManager.originalImgPhoto,
          height: 18.h,
          width: 40.w,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: 4.w,
          top: 1.2.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: ColorManager.primaryColor,
                ),
                child: AppText(
                  text: "عرض حصري",
                  fontSize: 14.px,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                  fontFamily: "EffraTrial",
                ),
              ),
              SizedBox(height: .5.h),
              AppText(
                text: "خصم 10% لفتره محدوده",
                fontSize: 20.px,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                fontFamily: "EffraTrial",
              ),
              SizedBox(height: .5.h),
              AppText(
                text: "احجز وحدتك الآن واحصل على خصم حصري",
                fontSize: 14.px,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
                fontFamily: "EffraTrial",
              ),
              SizedBox(height: .5.h),
              Row(
                children: [
                  AppText(
                    text: "متاح حتي 2 سبتمبر ",
                    fontSize: 14.px,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    fontFamily: "EffraTrial",
                  ),
                  SizedBox(width: 1.w),
                  SvgPicture.asset(AppSvgAssetsManager.clockIcon, height: 2.h),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSearchCard({required Function onTap}) {
  return Container(
    width: double.infinity,
    height: 17.h,
    margin: EdgeInsets.symmetric(horizontal: 4.w),
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      color: Colors.grey.shade600,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("فيلا", style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(width: 2.w),
            Container(
              height: 4.h,
              width: 10.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: ColorManager.starRateColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AppSvgAssetsManager.homeIcon2),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.3.w, vertical: .2.h),
          child: Text(
            "فيلا • 5 غرف • الرياض • 1,000,000 - 2,000,000",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        SizedBox(height: .5.h),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 5.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5.w),
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Center(
              child: Text(
                "مواصلة البحث",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "EffraTrial",
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
