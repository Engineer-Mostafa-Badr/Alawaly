import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D3A1A), // الخلفية
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.apartment, color: Colors.white),
                  const SizedBox(width: 10),
                  const Icon(Icons.apartment_outlined, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.white70),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "البحث بالمنطقة، المشروع...",
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // فلاتر
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilter("المدينة"),
                    const SizedBox(width: 8),
                    _buildFilter("نوع الوحدات"),
                    const SizedBox(width: 8),
                    _buildFilter("حالة البناء"),
                  ],
                ),
              ),
            ),

            // الوحدات
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildUnitCard();
                },
              ),
            ),

            // شريط تحت
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              color: const Color(0xFF5D3A1A),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PageRouteName.advancedResearchRoute,
                      );
                    },
                  ),
                  const Icon(Icons.map, color: Colors.orange, size: 35),
                  const Icon(Icons.filter_list, color: Colors.white, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // زرار الفلاتر
  static Widget _buildFilter(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  // كارت الوحدة
  static Widget _buildUnitCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // صورة
          Image.asset(
            AppAssetsManager.frame3Photo,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // تظليل أسفل
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
          ),

          // شارة أعلى
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "وحدات نادرة",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),

          // التفاصيل تحت
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "فيلا دوبلكس - العوالي رايز",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text(
                  "عنوان الوحدة بالتفصيل",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.crop_square, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        "112 م2",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.bed, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        "3 غرف",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.bathtub, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        "3 حمام",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "25,000 ﷼",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
