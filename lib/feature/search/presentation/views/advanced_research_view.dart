import 'package:flutter/material.dart';

class AdvancedResearchView extends StatefulWidget {
  const AdvancedResearchView({super.key});

  @override
  State<AdvancedResearchView> createState() => _AdvancedResearchViewState();
}

class _AdvancedResearchViewState extends State<AdvancedResearchView> {
  RangeValues areaRange = const RangeValues(0, 1000);
  RangeValues budgetRange = const RangeValues(60000, 1890000);
  int selectedRooms = 2;
  String finishingLevel = "التشطيبات الأساسية";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "خيارات البحث",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: "نطاق المساحة (متر مربع)",
              child: RangeSlider(
                values: areaRange,
                min: 0,
                max: 2000,
                divisions: 20,
                activeColor: const Color(0xffD7A574),
                inactiveColor: Colors.grey.shade600,
                onChanged: (values) {
                  setState(() => areaRange = values);
                },
              ),
            ),
            _buildSection(
              title: "الميزانية",
              child: RangeSlider(
                values: budgetRange,
                min: 60000,
                max: 1890000,
                divisions: 30,
                activeColor: const Color(0xffD7A574),
                inactiveColor: Colors.grey.shade600,
                onChanged: (values) {
                  setState(() => budgetRange = values);
                },
              ),
            ),
            _buildSection(
              title: "عدد الغرف",
              child: Wrap(
                spacing: 8,
                children: List.generate(6, (index) {
                  final rooms = index == 0 ? "+5" : "$index";
                  return ChoiceChip(
                    label: Text(
                      rooms,
                      style: TextStyle(
                        color: selectedRooms == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    selected: selectedRooms == index,
                    selectedColor: const Color(0xffD7A574),
                    backgroundColor: Colors.grey.shade300,
                    onSelected: (_) {
                      setState(() => selectedRooms = index);
                    },
                  );
                }),
              ),
            ),
            _buildSection(
              title: "مستوى التشطيب",
              child: Wrap(
                spacing: 8,
                children:
                    [
                      "تشطيب كامل",
                      "نصف تشطيب",
                      "بدون تشطيب",
                      "التشطيبات الأساسية",
                    ].map((e) {
                      return ChoiceChip(
                        label: Text(
                          e,
                          style: TextStyle(
                            color: finishingLevel == e
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        selected: finishingLevel == e,
                        selectedColor: const Color(0xffD7A574),
                        backgroundColor: Colors.grey.shade300,
                        onSelected: (_) {
                          setState(() => finishingLevel = e);
                        },
                      );
                    }).toList(),
              ),
            ),
            _buildSection(
              title: "تاريخ الاستلام المتوقع",
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "حدد تاريخ الاستلام",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: const Color(0xff2C2C2C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            _buildSection(
              title: "مميزات خاصة",
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    [
                      "مطل على البحر",
                      "قريب من المترو",
                      "المتاجر",
                      "المستشفيات",
                      "الحدائق",
                      "أماكن ترفيهية",
                      "مراكز تجارية",
                      "الصيدليات",
                      "مراكز صيانة",
                      "مساجد",
                    ].map((e) {
                      return FilterChip(
                        label: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        selected: false,
                        backgroundColor: const Color(0xff2C2C2C),
                        onSelected: (_) {},
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text("إعادة تعيين الكل"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD7A574),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "عرض 980 نتائج",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff2C2C2C),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "إلغاء",
                  style: TextStyle(color: Color(0xffD7A574), fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
