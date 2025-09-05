import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';
import '../components/city_tab_widget.dart';
import '../components/sections_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "أحدث مشاريعنا",
          actionText: "عرض الكل",
          onActionTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: SizedBox(
            height: 4.h,
            child: ListView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              children: const [
                CityTabWidget(title: "المدينة (12)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "جدة (81)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "الرياض (8)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "كل المدن", selected: true),
                SizedBox(width: 16),
                CityTabWidget(title: "المدينة (12)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "جدة (81)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "الرياض (8)", selected: false),
                SizedBox(width: 16),
                CityTabWidget(title: "كل المدن", selected: true),
              ],
            ),
          ),
        ),
        SizedBox(height: 1.h),
        CustomScrollList(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
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
            ),
          ),
          sizeBoxHeight: 33.h,
        ),
      ],
    );
  }
}
