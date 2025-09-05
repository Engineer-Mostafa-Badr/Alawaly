import 'package:flutter/material.dart';

/// Generic Scrollable List
/// - بتتعامل مع أي ListView (أفقي أو عمودي)
/// - بيتحدد الحجم من SizedBox الأب اللي بيحتويها
/// - بتاخد itemBuilder, itemCount, scrollDirection, padding
class CustomScrollList extends StatelessWidget {
  final Axis scrollDirection;
  final int itemCount;
  final double sizeBoxHeight;
  final double? sizeBoxWidth;
  final Widget Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final bool? reverse;
  final ScrollPhysics? physics;

  const CustomScrollList({
    super.key,
    this.padding,
    this.sizeBoxWidth,
    this.physics,
    this.reverse,
    required this.itemCount,
    required this.itemBuilder,
    required this.sizeBoxHeight,
    required this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeBoxHeight,
      width: sizeBoxWidth ?? double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: physics,
        reverse: reverse ?? false,
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        padding: padding,
      ),
    );
  }
}
