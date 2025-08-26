import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        backgroundColor: const Color(0xFF111111),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(AppAssetsManager.frame5Photo),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ashfak Sayem",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "ashfaksayem@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // القائمة
              _buildSectionTitle("القائمة"),
              _buildMenuItem(
                "الرئيسية",
                AppSvgAssetsManager.homeIcon3,
                selected: true,
              ),
              _buildMenuItem("العقارات", AppSvgAssetsManager.bookIcon),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.dashboardRoute,
                  );
                },
                child: _buildMenuItem(
                  "لوحة التحكم",
                  AppSvgAssetsManager.peopleIcon,
                ),
              ),

              // زر انضم
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PageRouteName.createArealEstateMarketerAccountRoute,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB6FF81), Color(0xFFFFD580)],
                      ),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(AppSvgAssetsManager.homeIcon3),
                      title: const Text(
                        "انضم إلى مسوقينا العقاريين",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              _buildSectionTitle("الصفحات"),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageRouteName.notificationsRoute,
                  );
                },
                child: _buildMenuItem(
                  "الاشعارات",
                  AppSvgAssetsManager.notificationIcon2,
                  badgeCount: 12,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.favoriteRoute,
                  );
                },
                child: _buildMenuItem("المفضلة", AppSvgAssetsManager.heartIcon),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.unitTrackingDetailsRoute,
                  );
                },
                child: _buildMenuItem(
                  "تتبع وحداتك",
                  AppSvgAssetsManager.peopleIcon,
                ),
              ),

              _buildMenuItem("سجل الاهتمامات", AppSvgAssetsManager.peopleIcon),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.interviewAppointmentRoute,
                  );
                },
                child: _buildMenuItem(
                  "مواعيد المقابلات",
                  AppSvgAssetsManager.peopleIcon,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRouteName.contactAdminRoute);
                },
                child: _buildMenuItem(
                  "تواصل معنا",
                  AppSvgAssetsManager.peopleIcon,
                ),
              ),
              const Divider(color: Colors.grey),
              _buildSectionTitle("الاعدادات"),
              _buildMenuItem("الاعدادات", AppSvgAssetsManager.settingIcon),
              _buildMenuItem(
                "المساعدة والدعم",
                AppSvgAssetsManager.messageIcon,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B4B3A),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "تسجيل دخول",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // إصدار التطبيق
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "إصدار التطبيق· 1.0.3",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 13),
      ),
    );
  }

  Widget _buildMenuItem(
    String title,
    String svgAsset, {
    bool selected = false,
    int? badgeCount,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF7B4B3A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              // ignore: deprecated_member_use
              SvgPicture.asset(svgAsset, color: Colors.white),
              if (badgeCount != null)
                Positioned(
                  right: -12,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B4B3A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badgeCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
