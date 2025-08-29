import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C1E14),
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: GoogleFonts.cairo(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "البحث بالمنطقة، المشروع...",
                    hintStyle: GoogleFonts.cairo(color: Colors.white70),
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            // 🔘 Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    filterChip("المدينة"),
                    filterChip("نوع الوحدات"),
                    filterChip("حالة البناء"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🏡 Projects List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                itemBuilder: (context, index) => projectCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎨 Filter Button
  Widget filterChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: GoogleFonts.cairo(color: Colors.white)),
      ),
    );
  }

  // 🏡 Project Card
  Widget projectCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF3B2A1D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 🖼 Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  AppAssetsManager.frame4Photo, // ضع صورة المشروع هنا
                  fit: BoxFit.cover,
                  height: 160,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: const Icon(Icons.favorite_border, color: Colors.brown),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "يبدأ من 840 الف",
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "اسم المشروع",
                  style: GoogleFonts.cairo(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "اسم الشارع - اسم الحي - اسم المدينة - اسم المنطقة",
                  style: GoogleFonts.cairo(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  "موعد الاستلام: 2028",
                  style: GoogleFonts.cairo(color: Colors.white70, fontSize: 12),
                ),

                const SizedBox(height: 8),

                // 🏷 Tags
                Wrap(
                  spacing: 6,
                  children: [
                    tagChip("كون ماوس"),
                    tagChip("غرف"),
                    tagChip("شقق"),
                    tagChip("استوديو"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🏷 Small Tag
  Widget tagChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: GoogleFonts.cairo(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
