import '../../../../../core/resources/app_imports.dart';
import '../components/news_card_widget.dart';
import '../components/sections_header.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "آخر الاخبار",
          actionText: "جميع الاخبار",
          onActionTap: () {},
        ),
        SizedBox(height: 2.h),
        NewsCardWidget(
          title: "إطلاق المرحلة الثانية من مشروع الواحة",
          subtitle1: "تقرير جديد يكشف ارتفاع عدد المشاريع تحت الإنشاء",
          subtitle2: "..وزيادة الإقبال على الوحدات الجاهزة",
          imageUrl: AppAssetsManager.framePhoto,
          date: '22 يناير 2024',
        ),
        NewsCardWidget(
          title: "شراكة جديدة مع بنك الإسكان",
          subtitle1: "تقرير جديد يكشف ارتفاع عدد المشاريع تحت الإنشاء",
          subtitle2: "..وزيادة الإقبال على الوحدات الجاهزة",
          imageUrl: AppAssetsManager.frame2Photo,
          date: '22 يناير 2024',
        ),
      ],
    );
  }
}
