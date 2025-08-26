import 'package:flutter/material.dart';

class ContactAdminView extends StatelessWidget {
  const ContactAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1C1C), Color(0xFF3C2C1F)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "تواصل مع الادارة",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // نوع الموضوع
                DropdownButtonFormField<String>(
                  decoration: _inputDecoration("نوع الموضوع"),
                  items: ["استفسار", "شكوى", "اقتراح"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 12),

                // عنوان الموضوع
                TextField(decoration: _inputDecoration("عنوان الموضوع")),
                const SizedBox(height: 12),

                // تفاصيل الرسالة
                TextField(
                  maxLines: 4,
                  decoration: _inputDecoration("تفاصيل الرسالة"),
                ),
                const SizedBox(height: 12),

                // زر ارسال
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("إرسال"),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "المحادثات السابقة",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 12),

                // المحادثات
                Expanded(
                  child: ListView(
                    children: const [
                      ChatItem(
                        title: "استفسار عن الخدمات",
                        message: "أود الاستفسار عن الخدمات المتاحه...",
                        status: "تم الرد",
                        statusColor: Colors.green,
                        icon: Icons.check_circle,
                      ),
                      ChatItem(
                        title: "استفسار عن الخدمات",
                        message: "أود الاستفسار عن الخدمات المتاحه...",
                        status: "قيد التفاوض",
                        statusColor: Colors.orange,
                        icon: Icons.pending,
                      ),
                      ChatItem(
                        title: "استفسار عن الخدمات",
                        message: "أود الاستفسار عن الخدمات المتاحه...",
                        status: "قيد التفاوض",
                        statusColor: Colors.orange,
                        icon: Icons.pending,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey.shade300,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String title;
  final String message;
  final String status;
  final Color statusColor;
  final IconData icon;

  const ChatItem({
    super.key,
    required this.title,
    required this.message,
    required this.status,
    required this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(message, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(icon, size: 18, color: statusColor),
              const SizedBox(width: 6),
              Text(status, style: TextStyle(color: statusColor, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}
