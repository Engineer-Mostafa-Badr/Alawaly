import 'package:flutter/material.dart';

class CreateArealEstateMarketerAccountView extends StatefulWidget {
  const CreateArealEstateMarketerAccountView({super.key});

  @override
  State<CreateArealEstateMarketerAccountView> createState() =>
      _CreateArealEstateMarketerAccountViewState();
}

class _CreateArealEstateMarketerAccountViewState
    extends State<CreateArealEstateMarketerAccountView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectedRegion;

  final List<String> regions = [
    "القاهرة",
    "الجيزة",
    "الإسكندرية",
    "الأقصر",
    "أسوان",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color(0xFF6A4C2F)],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "إنشاء حساب\nكمسوق عقاري",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 30),

                // الاسم كامل
                buildLabel("الاسم كامل"),
                buildTextField("أدخل اسمك بالكامل", fullNameController),

                // رقم الجوال
                buildLabel("رقم الجوال"),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "+234",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.flag, color: Colors.green),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildTextField("0901 234 5678", phoneController),
                    ),
                  ],
                ),

                // البريد الإلكتروني
                buildLabel("البريد الالكتروني"),
                buildTextField("someone23@mail.com", emailController),

                // المنطقة
                buildLabel("المنطقة"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade800,
                      value: selectedRegion,
                      hint: const Text(
                        "حدد المنطقة",
                        style: TextStyle(color: Colors.black54),
                      ),
                      items: regions
                          .map(
                            (region) => DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRegion = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // إثبات الهوية
                buildLabel("إثبات الهوية أو بطاقة العمل"),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "لم يتم اختيار ملفات",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 40),

                // زرار فارغ تحت
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget buildTextField(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.grey.shade400,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
