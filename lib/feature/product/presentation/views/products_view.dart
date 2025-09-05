import '../../../../core/custom_widget/floating_actions.dart';
import '../../../search/presentation/views/search_view.dart';
import '../../../../../core/resources/app_imports.dart';
import 'components/page_switcher.dart';
import 'components/products_body.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int selectedPageIndex = 0;

  final List<Widget> pages = const [ProductsBody(), SearchView()];

  void _onPageSelected(int index) {
    setState(() => selectedPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(index: selectedPageIndex, children: pages),
          Positioned(
            top: 2.5.h,
            left: 3.w,
            child: PageSwitcher(
              currentIndex: selectedPageIndex,
              onIconTap: _onPageSelected,
            ),
          ),
          FloatingActions(
            buttons: [
              FloatingButtonData(
                left: 33.w,
                right: 33.w,
                icon: AppSvgAssetsManager.simplificationIcon,
                label: "الخريطة",
                onTap: () => debugPrint("خريطة"),
              ),
              FloatingButtonData(
                left: 73.w,
                right: 13.w,
                icon: AppSvgAssetsManager.preferenceHorizontalIcon,
                onTap: () => debugPrint("فلتر"),
              ),
              FloatingButtonData(
                left: 13.w,
                right: 73.w,
                icon: AppSvgAssetsManager.allIcon,
                onTap: () => debugPrint("الكل"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
