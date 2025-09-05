import '../../../../../core/resources/app_imports.dart';
import '../components/search_card_widget.dart';
import '../components/sections_header.dart';

class ResumeSearchSection extends StatelessWidget {
  const ResumeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(title: "استكمل بحثك السابق"),
        SizedBox(height: 2.h),
        SearchCardWidget(
          onTap: () {
            Navigator.pushNamed(context, PageRouteName.searchRoute);
          },
        ),
      ],
    );
  }
}
