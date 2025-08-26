import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.brown[700],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AppAssetsManager.productPhoto,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),

          // السعر
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.brown[800],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أسعار الوحدات تبدأ من",
                    // ignore: deprecated_member_use
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "25,250,000 ﷼",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // تفاصيل أساسية
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "برج السلام الآخر",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    lineHeight: 8,
                    percent: 0.65,
                    backgroundColor: Colors.grey[300]!,
                    progressColor: Colors.brown,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "نسبة الإنجاز: 65% - موعد التسليم: الربع الثالث 2024",
                  ),
                  const SizedBox(height: 16),

                  // أزرار التفاصيل
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _detailButton(Icons.map, "مخطط المشروع"),
                      _detailButton(Icons.apartment, "عرض على الخريطة"),
                      _detailButton(Icons.photo, "صور المشروع"),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text("الوحدات المتاحة", style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),

                  // كارد وحدات
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Container(
                        width: 220,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.asset(
                                AppAssetsManager.frame6Photo,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("فيلا دوبلكس - الحواري باي"),
                                  SizedBox(height: 4),
                                  Text("3 غرف - 2 حمام - 2112 م²"),
                                  SizedBox(height: 8),
                                  Text(
                                    "25,000 ﷼",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // خدمات المشروع
                  const Text("خدمات المشروع", style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 20,
                    runSpacing: 16,
                    children: const [
                      _serviceIcon(Icons.security, "أمن 24/7"),
                      _serviceIcon(Icons.pool, "مسبح"),
                      _serviceIcon(Icons.local_parking, "مواقف سيارات"),
                      _serviceIcon(Icons.park, "حدائق"),
                      _serviceIcon(Icons.sports_soccer, "نادي رياضي"),
                      _serviceIcon(Icons.mosque, "مسجد"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // عن المشروع
                  const Text("عن المشروع", style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 6),
                  const Text(
                    "هناك العديد من الأنواع المتوفرة لمشروع لوريم إيبسوم...",
                  ),

                  const SizedBox(height: 20),

                  // نظرة عامة
                  const Text(
                    "نظرة عامة عن المشروع",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text("المطور: شركة الإعمار العقارية"),
                  const Text("الموقع: الرياض - حي النرجس"),
                  const Text("المساحة: 10,000 م²"),
                  const Text("عدد الوحدات: 200"),

                  const SizedBox(height: 20),

                  // زرار
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("حدد موعد للمقابلة"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailButton(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.brown[100],
          child: Icon(icon, color: Colors.brown[700]),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// ignore: camel_case_types
class _serviceIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  const _serviceIcon(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.brown[100],
          child: Icon(icon, color: Colors.brown[700]),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
