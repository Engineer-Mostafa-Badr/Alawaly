import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';
import '../components/city_tab_widget.dart';
import '../components/sections_header.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  // 🔹 المتغير اللي بيحفظ العنصر المحدد
  int selectedIndex = 3; // مثلاً "كل المدن" هو الافتراضي

  final List<String> cities = [
    "المدينة (12)",
    "جدة (81)",
    "الرياض (8)",
    "كل المدن",
    "المدينة (12)",
    "جدة (81)",
    "الرياض (8)",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "أحدث مشاريعنا",
          actionText: "عرض الكل",
          onActionTap: () {
            Navigator.pushReplacementNamed(context, PageRouteName.viewAllRoute);
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: SizedBox(
            height: 4.h,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index; // ✅ تحديث العنصر المحدد
                        });
                      },
                      child: CityTabWidget(
                        title: cities[index],
                        selected: selectedIndex == index, // ✅ التحديد الحالي
                      ),
                    ),
                    if (index != cities.length - 0) const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 1.h),

        /// 🔹 هنا هي القائمة الأفقية للمشاريع
        CustomScrollList(
          sizeBoxHeight: 33.h,
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PageRouteName.productDetailsRoute,
                );
              },
              child: ProjectCard(
                imagePath: AppAssetsManager.imgPhoto,
                isFavorite: false,
                status: 'قيد الإنشاء',
                city: 'الرياض',
                price: "840 الف",
                projectName: 'اسم المشروع',
                address: 'اسم الشارع - اسم الحي -اسم المدينة - اسم المنطقة',
                deliveryDate: '2028',
                unitTypes: ['تاون هاوس', 'شقة', 'استوديو', 'استوديو'],
                showPriceOnPhoto: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
