import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';
import '../components/unit_card_widget.dart';
import '../components/sections_header.dart';

class UnitsSection extends StatelessWidget {
  const UnitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "الوحدات المميزة",
          actionText: "جميع العقارات",
          onActionTap: () {},
        ),
        SizedBox(height: 2.h),
        CustomScrollList(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: UnitCardWidget(),
          ),
          sizeBoxHeight: 33.h,
        ),
      ],
    );
  }
}
