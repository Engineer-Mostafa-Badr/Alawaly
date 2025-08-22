import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            _buildMenuItem("الرئيسية", Icons.home, selected: true),
            _buildMenuItem("العقارات", Icons.menu_book_outlined),
            _buildMenuItem("لوحة التحكم", Icons.people_alt_outlined),

            // زر انضم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFB6FF81), Color(0xFFFFD580)],
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text(
                    "انضم إلى مسوقينا العقاريين",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),

            const Divider(color: Colors.grey),

            // الصفحات
            _buildSectionTitle("الصفحات"),
            _buildMenuItem(
              "الاشعارات",
              Icons.notifications_none,
              badgeCount: 12,
            ),
            _buildMenuItem("المفضلة", Icons.favorite_border),
            _buildMenuItem("تبع وحداتك", Icons.people_alt_outlined),
            _buildMenuItem("سجل الاهتمامات", Icons.people_alt_outlined),
            _buildMenuItem("مواعيد المقابلات", Icons.people_alt_outlined),
            _buildMenuItem("تواصل معنا", Icons.people_alt_outlined),

            const Divider(color: Colors.grey),

            // الاعدادات
            _buildSectionTitle("الاعدادات"),
            _buildMenuItem("الاعدادات", Icons.settings),
            _buildMenuItem("المساعدة والدعم", Icons.help_outline),

            const Spacer(),

            // زر تسجيل الدخول
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
    IconData icon, {
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
              Icon(icon, color: Colors.white),
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
