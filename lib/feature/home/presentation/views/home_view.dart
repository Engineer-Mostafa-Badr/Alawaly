import '../../../product/presentation/views/products_view.dart';
import '../../../profile/presentation/views/favorite_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../more/presentation/views/more_view.dart';
import '../../../../../core/resources/app_imports.dart';
import 'components/custom_buttom_nav_bar.dart';
import 'sections/recommendations_section.dart';
import 'sections/resume_search_section.dart';
import 'sections/home_banner_section.dart';
import 'sections/projects_section.dart';
import 'sections/offers_section.dart';
import 'sections/units_section.dart';
import 'sections/news_section.dart';
import 'sections/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 4;

  final List<Widget> _pages = const [
    MoreView(),
    ProfileView(),
    FavoriteView(),
    ProductsView(),
    HomeContent(),
  ];

  void _onNavItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: ColorManager.homeBackground,
          ),
          child: Stack(
            children: [
              IndexedStack(index: _currentIndex, children: _pages),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: CustomBottomNavBar(
                    currentIndex: _currentIndex,
                    onItemSelected: _onNavItemSelected,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(),
          const HomeBannerSection(),
          SizedBox(height: 1.h),
          const ProjectsSection(),
          SizedBox(height: 2.h),
          const UnitsSection(),
          SizedBox(height: 2.h),
          const NewsSection(),
          SizedBox(height: 2.h),
          const OffersSection(),
          SizedBox(height: 2.h),
          const ResumeSearchSection(),
          SizedBox(height: 2.h),
          const RecommendationsSection(),
          SizedBox(height: 7.h),
        ],
      ),
    );
  }
}
