import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية غامقة مع جريدينت
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "الإشعارات",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E1C1C), Color(0xFF3B2E25)],
          ),
        ),
        child: Column(
          children: [
            // الفلاتر (Tabs)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildTab("الكل", selected: true),
                  _buildTab("العروض"),
                  _buildTab("المدفوعات"),
                  _buildTab("المشاريع"),
                  _buildTab("العقود"),
                ],
              ),
            ),
            const Divider(color: Colors.white24, thickness: 0.5),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSectionTitle("اليوم"),
                  _buildNotificationCard(
                    icon: Icons.calendar_month,
                    title: "عروض خاصة: خصم %20",
                    subtitle:
                        "لديك موعد معاينة للوحدة A103 غداً الساعة 2 مساءً",
                    time: "10:30 ص",
                  ),
                  _buildNotificationCard(
                    icon: Icons.account_balance_wallet,
                    title: "عروض خاصة: خصم %20",
                    subtitle:
                        "لديك موعد معاينة للوحدة A103 غداً الساعة 2 مساءً",
                    time: "10:30 ص",
                  ),
                  const SizedBox(height: 12),
                  _buildSectionTitle("الأمس"),
                  _buildNotificationCard(
                    icon: Icons.mail,
                    title: "عروض خاصة: خصم %20",
                    subtitle:
                        "لديك موعد معاينة للوحدة A103 غداً الساعة 2 مساءً",
                    time: "10:30 ص",
                  ),
                  _buildNotificationCard(
                    icon: Icons.card_giftcard,
                    title: "عروض خاصة: خصم %20",
                    subtitle:
                        "لديك موعد معاينة للوحدة A103 غداً الساعة 2 مساءً",
                    time: "10:30 ص",
                  ),
                  const SizedBox(height: 12),
                  _buildSectionTitle("هذا الأسبوع"),
                  _buildNotificationCard(
                    icon: Icons.card_giftcard,
                    title: "عروض خاصة: خصم %20",
                    subtitle:
                        "لديك موعد معاينة للوحدة A103 غداً الساعة 2 مساءً",
                    time: "10:30 ص",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFD48E59) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? const Color(0xFFD48E59) : Colors.white54,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: selected ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white24,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "عرض التفاصيل",
                    style: TextStyle(
                      color: Color(0xFFD48E59),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
