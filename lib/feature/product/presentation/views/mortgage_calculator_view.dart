import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class MortgageCalculatorView extends StatefulWidget {
  const MortgageCalculatorView({super.key});

  @override
  State<MortgageCalculatorView> createState() => _MortgageCalculatorViewState();
}

class _MortgageCalculatorViewState extends State<MortgageCalculatorView> {
  double downPayment = 2000;
  double loanYears = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "الحاسبة العقارية",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Bank selection
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _bankCard(
                      "البنك الاهلي السعودي",
                      "معدل الربح: %3.99",
                      selected: true,
                      logo: AppAssetsManager.frame6Photo,
                    ),
                    const SizedBox(width: 12),
                    _bankCard(
                      "البنك الثاني",
                      "معدل الربح: %2.50",
                      logo: AppAssetsManager.frame6Photo,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Property value
              const Text(
                "قيمة العقار",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "25,000 ر.س",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Down payment slider
              _labelWithValue("الدفعة الاولى", "${downPayment.toInt()} ر.س"),
              Slider(
                value: downPayment,
                min: 2000,
                max: 15000,
                activeColor: Colors.brown,
                inactiveColor: Colors.grey.shade800,
                onChanged: (val) {
                  setState(() {
                    downPayment = val;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Loan years slider
              _labelWithValue("مدة التمويل", "${loanYears.toInt()} عام"),
              Slider(
                value: loanYears,
                min: 5,
                max: 15,
                divisions: 10,
                activeColor: Colors.brown,
                inactiveColor: Colors.grey.shade800,
                onChanged: (val) {
                  setState(() {
                    loanYears = val;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Results Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _resultRow("القسط الشهري", "17,587 ر.س"),
                    _resultRow("إجمالي مبلغ التمويل", "850,587 ر.س"),
                    _resultRow("إجمالي الفوائد", "140,587 ر.س"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B50),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "تقديم طلب التمويل",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Warning
              Row(
                children: const [
                  Icon(Icons.warning_amber_rounded, color: Colors.amber),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "هذه النتائج تقريبية يرجى التواصل مع البنك للحصول على التفاصيل الدقيقة",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bankCard(
    String title,
    String subtitle, {
    bool selected = false,
    String? logo,
  }) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2A2A2A) : Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: selected ? Border.all(color: Colors.brown, width: 2) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logo != null) Image.asset(logo, height: 40),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _labelWithValue(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class _resultRow extends StatelessWidget {
  final String label;
  final String value;

  const _resultRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
