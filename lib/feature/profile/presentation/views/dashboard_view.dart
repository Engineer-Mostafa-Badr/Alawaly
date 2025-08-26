import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D332D),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3D332D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "المزيد",
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Text("S"),
                  ),
                  Image.asset(AppAssetsManager.frame4Photo, height: 40),
                ],
              ),
              const SizedBox(height: 20),

              // Green notification card
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تم قبول طلب العميل",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "تم قبول طلب أحمد محمد للوحدة رقم 123 الآن منذ ساعتين",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // وحداتي الحالية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("عرض الكل", style: TextStyle(color: Colors.grey)),
                  Text(
                    "وحداتي الحالية",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Card 1
              _unitCard(progress: 0.75),

              const SizedBox(height: 16),

              // Card 2
              _unitCard(progress: 0.0),

              const SizedBox(height: 20),

              // شاهدت مؤخراً
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("عرض الكل", style: TextStyle(color: Colors.grey)),
                  Text(
                    "شاهدت مؤخراً",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              _recentCard(isFavorite: true),
              const SizedBox(height: 12),
              _recentCard(isFavorite: false),

              const SizedBox(height: 20),

              // اخر بحث
              const Text(
                "اخر بحث",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF5A4B41),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "فيلا - 5 غرف - الرياض، 1,000,000 - 2,000,000",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Checkbox(
                      value: true,
                      onChanged: (val) {},
                      checkColor: Colors.white,
                      activeColor: Colors.brown,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("مواصلة البحث"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// الوحدات الحالية
Widget _unitCard({required double progress}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: const Color(0xFF5A4B41),
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.asset(AppAssetsManager.frame6Photo, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "A12 - فيلا دوبلكس",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Text(
                "مشروع الواحة",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                color: Colors.yellow,
                backgroundColor: Colors.grey.shade700,
                minHeight: 6,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// الكروت اللي في "شاهدت مؤخراً"
Widget _recentCard({required bool isFavorite}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: const Color(0xFF5A4B41),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppAssetsManager.framePhoto,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "A12 - فيلا دوبلكس",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                "3 غرف • 3 حمام • 112 م2",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(height: 6),
              Text(
                "20,746,000 ﷼",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.white,
        ),
      ],
    ),
  );
}
