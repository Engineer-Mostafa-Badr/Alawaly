import 'package:alawaly_app/core/resources/app_imports.dart';
import '../components/sections_header.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "التوصيات العقارية",
          actionText: "جميع الاخبار",
          onActionTap: () {
            Navigator.pushReplacementNamed(context, PageRouteName.allNewsRoute);
          },
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
