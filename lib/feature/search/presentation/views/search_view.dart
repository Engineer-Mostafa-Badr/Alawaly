import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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

  static Widget _buildUnitCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            AppAssetsManager.frame3Photo,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
          ),

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
