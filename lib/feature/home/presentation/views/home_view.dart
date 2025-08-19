import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/resources/app_color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3b2a1a),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// ===== AppBar =====
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          child: SvgPicture.asset(
                            AppSvgAssetsManager.profileIcon,
                            height: 2.5.h,
                            // ignore: deprecated_member_use
                            color: ColorManager.grey2,
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

              /// ===== Carousel Slider =====
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
                  autoPlay: true,
                ),
              ),

              /// ===== Tabs للمدن =====
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  children: [
                    _buildCityTab("المدينة (12)", false),
                    SizedBox(width: 2.w),
                    _buildCityTab("جدة (81)", false),
                    SizedBox(width: 2.w),
                    _buildCityTab("الرياض (8)", false),
                    SizedBox(width: 2.w),
                    _buildCityTab("كل المدن", true),
                  ],
                ),
              ),

              /// ===== أحدث المشاريع =====
              _buildSectionTitle("أحدث مشاريعنا"),
              SizedBox(height: 2.h),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) => _buildProjectCard(),
                ),
              ),

              /// ===== الوحدات المميزة =====
              _buildSectionTitle("الوحدات المميزة"),
              SizedBox(height: 2.h),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) => _buildUnitCard(),
                ),
              ),

              /// ===== آخر الأخبار =====
              _buildSectionTitle("آخر الأخبار"),
              SizedBox(height: 2.h),
              _buildNewsCard(
                "إطلاق المرحلة الثانية من مشروع الواحة",
                "تقرير جديد يشيد بارتفاع الطلب على الوحدات",
              ),
              _buildNewsCard(
                "شراكة جديدة مع بنك الإسكان",
                "تقرير جديد يشيد بارتفاع الطلب على الوحدات",
              ),

              /// ===== عروض تسويقية =====
              _buildSectionTitle("عروض تسويقية"),
              SizedBox(height: 2.h),
              _buildOfferCard(),

              /// ===== بحث سريع =====
              _buildSectionTitle("استكمل بحثك السابق"),
              SizedBox(height: 2.h),
              _buildSearchCard(),

              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),

      /// ===== Bottom Navigation Bar =====
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff3b2a1a),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "العقارات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "الأخبار",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "المزيد",
          ),
        ],
      ),
    );
  }

  Widget _buildCityTab(String title, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12),
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
      width: 280,
      margin: EdgeInsets.only(left: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              AppAssetsManager.appLogo,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "اسم المشروع",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  "الرياض - حي النخيل",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
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
      width: 220,
      margin: EdgeInsets.only(left: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              AppAssetsManager.appLogo,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: const Text(
              "فيلا دوبلكس - العوالي ريزيدنس\n25,000 ريال",
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade900,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 0.5.h),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red.shade700,
      ),
      child: const Text(
        "خصم 10% لفترة محدودة",
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade800,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "فيلا - الرياض، 1,000,000 - 2,000,000 ريال",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Icon(Icons.home, color: Colors.orange),
        ],
      ),
    );
  }
}
