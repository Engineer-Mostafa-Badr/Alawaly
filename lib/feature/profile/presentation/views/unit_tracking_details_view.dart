import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class UnitTrackingDetailsView extends StatelessWidget {
  final List<Map<String, dynamic>> payments = [
    {
      "title": "الدفعة الأولي",
      "amount": "46,000 ر.س",
      "status": "تم السداد",
      "statusColor": Colors.green,
      "statusBg": Color(0xFFE7F8EC),
      "date": "15 يونيو 2024",
      "icon": Icons.check_circle,
    },
    {
      "title": "الدفعة الثانية",
      "amount": "46,000 ر.س",
      "status": "جاري",
      "statusColor": Colors.orange,
      "statusBg": Color(0xFFFFF3E5),
      "progress": "نسبة الإنجاز: %50",
      "icon": Icons.access_time,
    },
    {
      "title": "الدفعة الثالثة",
      "amount": "46,000 ر.س",
      "status": "متأخر",
      "statusColor": Colors.red,
      "statusBg": Color(0xFFFFEAEA),
      "progress": "نسبة الإنجاز: %30",
      "icon": Icons.error,
    },
    {
      "title": "الدفعة الرابعة",
      "amount": "46,000 ر.س",
      "status": "مستحق",
      "statusColor": Colors.orange,
      "statusBg": Color(0xFFFFF3E5),
      "progress": "نسبة الإنجاز: %30",
      "icon": Icons.access_time,
    },
    {
      "title": "الدفعة الخامسة",
      "amount": "46,000 ر.س",
      "status": "مستحق",
      "statusColor": Colors.orange,
      "statusBg": Color(0xFFFFF3E5),
      "progress": "نسبة الإنجاز: %30",
      "icon": Icons.access_time,
    },
    {
      "title": "الدفعة السادسة",
      "amount": "46,000 ر.س",
      "status": "مستحق",
      "statusColor": Colors.orange,
      "statusBg": Color(0xFFFFF3E5),
      "progress": "نسبة الإنجاز: %30",
      "icon": Icons.access_time,
    },
  ];

  UnitTrackingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF111111), Color(0xFF6A4B2F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- عنوان
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "تفاصيل المشروع",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // --- كارت المشروع
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // الصورة
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppAssetsManager.frame6Photo,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // النصوص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "فيلا دوبلكس C-22",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "مشروع العوالي ريزيدنس",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "نسبة الإنجاز 65%",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          LinearProgressIndicator(
                            value: 0.65,
                            backgroundColor: Colors.grey,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // --- قائمة الدفعات
              Expanded(
                child: ListView.builder(
                  itemCount: payments.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final item = payments[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // العنوان والمبلغ
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item["amount"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // حالة الدفع
                          Row(
                            children: [
                              Icon(
                                item["icon"],
                                color: item["statusColor"],
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: item["statusBg"],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item["status"],
                                  style: TextStyle(
                                    color: item["statusColor"],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (item["progress"] != null) ...[
                                const SizedBox(width: 10),
                                Text(
                                  item["progress"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (item["date"] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                item["date"],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
