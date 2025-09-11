import '../../../../core/custom_widget/floating_actions.dart';
import '../../../../../core/resources/app_imports.dart';
import 'components/products_list_body.dart';
import 'components/page_switcher.dart';
import 'components/filter_chip.dart';
import 'components/search_bar.dart';
import 'search_maps_view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int selectedPageIndex = 0;
  int selectedFilterIndex = 0;
  bool showProjectsSection = false;

  void _onPageSelected(int index) {
    setState(() {
      selectedPageIndex = index;
      showProjectsSection = false;
    });
  }

  void _onFilterSelected(int index) {
    setState(() => selectedFilterIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final bool isProductBody = selectedPageIndex == 0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: isProductBody
                  ? ColorManager.homeBackground
                  : ColorManager.appbarBackground,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PageSwitcher(
                          currentIndex: selectedPageIndex,
                          onIconTap: _onPageSelected,
                        ),
                        SizedBox(width: 2.w),
                        const Expanded(child: SearchBarContainer()),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FiltersChip(
                        label: "حالة البناء",
                        icon: AppSvgAssetsManager.scaleDownIcon,
                        index: 0,
                        isSelected: selectedFilterIndex == 0,
                        onSelected: _onFilterSelected,
                      ),
                      FiltersChip(
                        label: "نوع الوحدات",
                        icon: AppSvgAssetsManager.scaleDownIcon,
                        index: 1,
                        isSelected: selectedFilterIndex == 1,
                        onSelected: _onFilterSelected,
                      ),
                      FiltersChip(
                        label: "المدينة",
                        icon: AppSvgAssetsManager.errorIcon,
                        index: 2,
                        isSelected: selectedFilterIndex == 2,
                        onSelected: _onFilterSelected,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: IndexedStack(
                      index: selectedPageIndex,
                      children: [
                        ProductsListBody(scrollDirection: Axis.vertical),
                        SearchMapsView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isProductBody && !showProjectsSection)
            FloatingActions(
              buttons: [
                FloatingButtonData(
                  left: 33.w,
                  right: 33.w,
                  icon: AppSvgAssetsManager.simplificationIcon,
                  label: "الخريطة",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PageRouteName.mapsRoute,
                    );
                  },
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
            )
          else if (!isProductBody && !showProjectsSection)
            FloatingActions(
              buttons: [
                FloatingButtonData(
                  left: 33.w,
                  right: 33.w,
                  label: "القائمة",
                  icon: AppSvgAssetsManager.allIcon,
                  onTap: () {
                    setState(() {
                      showProjectsSection = true;
                    });
                  },
                ),
              ],
            ),
          if (showProjectsSection)
            Positioned(
              bottom: 15.h,
              left: 0.w,
              right: 0.w,
              child: ProductsListBody(
                scrollDirection: Axis.horizontal,
                sizeBoHeight: 48.h,
                paddingHorizontal: 2.w,
                showDetailsButton: true,
                showPriceOnPhoto: false,
                isProductView: true,
              ),
            ),
        ],
      ),
    );
  }
}
