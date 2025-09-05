import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';
import 'filter_chip.dart';
import 'search_bar.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  int selectedFilterIndex = 0;

  void _onFilterSelected(int index) {
    setState(() => selectedFilterIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: ColorManager.productBackground),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SearchBarContainer(),
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
              child: CustomScrollList(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: ProjectCard(
                    imagePath: AppAssetsManager.imgPhoto,
                    isFavorite: false,
                    status: 'قيد الإنشاء',
                    city: 'الرياض',
                    price: "840 الف",
                    projectName: 'اسم المشروع',
                    address:
                        'اسم الشارع - اسم الحي - اسم المدينة - اسم المنطقة',
                    deliveryDate: '2028',
                    unitTypes: ['تاون هاوس', 'شقة', 'استوديو'],
                  ),
                ),
                sizeBoxHeight: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
