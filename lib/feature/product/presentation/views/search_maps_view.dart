import 'package:flutter/material.dart';

class SearchMapsView extends StatelessWidget {
  const SearchMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: const Center(
          child: Text(
            "هنا الخريطة (تجربة)",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
