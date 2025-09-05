import 'package:flutter/material.dart';

class SearchMapsView extends StatefulWidget {
  const SearchMapsView({super.key});

  @override
  State<SearchMapsView> createState() => _SearchMapsViewState();
}

class _SearchMapsViewState extends State<SearchMapsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// مكان الخريطة (تجربة فقط)
          Container(
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                "هنا الخريطة (تجربة)",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ),

          /// شريط البحث والفلاتر
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "البحث بالمنطقة، المشروع...",
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey[700]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "المدينة",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "نوع الوحدات",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "حالة البناء",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// زر القائمة تحت
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width * 0.35,
            right: MediaQuery.of(context).size.width * 0.35,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم الضغط على زر القائمة")),
                );
              },
              icon: const Icon(Icons.list, color: Colors.white),
              label: const Text(
                "القائمة",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
