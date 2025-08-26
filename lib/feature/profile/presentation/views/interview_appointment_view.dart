import 'package:flutter/material.dart';

class InterviewAppointmentView extends StatefulWidget {
  const InterviewAppointmentView({super.key});

  @override
  State<InterviewAppointmentView> createState() => _BookingViewState();
}

class _BookingViewState extends State<InterviewAppointmentView> {
  int selectedInterviewType = 1;
  int selectedBranch = 0;
  int selectedDay = 0;
  bool hasSupport = false;

  List<String> branches = [
    "الفرع الرئيسي - الرياض\nشارع الملك فهد، حي العليا",
    "الفرع الرئيسي - الرياض\nشارع الملك فهد، حي العليا",
    "الفرع الرئيسي - الرياض\nشارع الملك فهد، حي العليا",
  ];

  List<String> days = [
    "الأحد 14 يناير",
    "الاثنين 15 يناير",
    "الثلاثاء 16 يناير",
    "الأربعاء 17 يناير",
    "الخميس 18 يناير",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "حدد موعد المقابلة",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // نوع المقابلة
            sectionTitle("اختر نوع المقابلة"),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: interviewTypeCard("مكالمة هاتفية", Icons.phone, 0),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: interviewTypeCard("مقابلة حضورية", Icons.apartment, 1),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // الفرع
            sectionTitle("اختر الفرع"),
            const SizedBox(height: 12),
            ...List.generate(
              branches.length,
              (index) => branchCard(branches[index], index),
            ),
            const SizedBox(height: 24),

            // الموعد
            sectionTitle("اختر الموعد"),
            const SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return dayCard(days[index], index);
                },
              ),
            ),
            const SizedBox(height: 24),

            // الوقت
            sectionTitle("اختر الوقت المتاح"),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // هنا ممكن تفتح DateTimePicker
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white30),
                  color: Colors.black26,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.calendar_today, color: Colors.white70, size: 20),
                    SizedBox(width: 12),
                    Text(
                      "حدد وقت المقابلة",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // دعم سكني
            Row(
              children: [
                Checkbox(
                  value: hasSupport,
                  onChanged: (value) {
                    setState(() {
                      hasSupport = value ?? false;
                    });
                  },
                  side: const BorderSide(color: Colors.white54),
                  activeColor: const Color(0xFF8B5E3C),
                ),
                const Text(
                  "هل لديك دعم سكني؟!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ملاحظات إضافية
            sectionTitle("ملاحظات إضافية"),
            const SizedBox(height: 12),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "مثال: أود معرفة تفاصيل خطة السداد....",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 32),

            // زر التأكيد
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5E3C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "تأكيد الحجز",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget interviewTypeCard(String title, IconData icon, int index) {
    bool selected = selectedInterviewType == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedInterviewType = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? const Color(0xFF8B5E3C) : Colors.black26,
          border: Border.all(
            color: selected ? const Color(0xFF8B5E3C) : Colors.white30,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget branchCard(String branch, int index) {
    bool selected = selectedBranch == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBranch = index;
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? const Color(0xFF8B5E3C) : Colors.black26,
          border: Border.all(
            color: selected ? const Color(0xFF8B5E3C) : Colors.white30,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: selected ? Colors.white : Colors.white70,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                branch,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dayCard(String day, int index) {
    bool selected = selectedDay == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDay = index;
        });
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? const Color(0xFF8B5E3C) : Colors.black26,
          border: Border.all(
            color: selected ? const Color(0xFF8B5E3C) : Colors.white30,
          ),
        ),
        child: Center(
          child: Text(
            day,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
