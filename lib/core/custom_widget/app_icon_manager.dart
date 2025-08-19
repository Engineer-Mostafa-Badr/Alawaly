import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon, this.iconColor, this.iconSize});

  final IconData icon;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconColor, size: iconSize?.w ?? 7.w);
  }
}
