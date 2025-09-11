import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';

class ProductsListBody extends StatelessWidget {
  const ProductsListBody({
    super.key,
    this.sizeBoHeight,
    this.paddingVertical,
    this.paddingHorizontal,
    required this.scrollDirection,
    this.showDetailsButton = false,
    this.showPriceOnPhoto = true,
    this.isProductView = false,
  });

  final Axis scrollDirection;
  final double? sizeBoHeight;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final bool showDetailsButton;
  final bool showPriceOnPhoto;
  final bool isProductView;

  @override
  Widget build(BuildContext context) {
    return CustomScrollList(
      scrollDirection: scrollDirection,
      sizeBoxHeight: sizeBoHeight ?? double.infinity,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? 3.w,
          vertical: paddingVertical ?? 1.h,
        ),
        child: ProjectCard(
          imagePath: isProductView
              ? AppAssetsManager.homePhoto
              : AppAssetsManager.imgPhoto,
          isFavorite: false,
          status: 'قيد الإنشاء',
          city: 'الرياض',
          price: isProductView ? "25,000" : "840 الف",
          projectName: 'اسم المشروع',
          address: 'اسم الشارع - اسم الحي - اسم المدينة - اسم المنطقة',
          deliveryDate: '2028',
          unitTypes: ['تاون هاوس', 'شقة', 'استوديو'],
          showDetailsButton: showDetailsButton,
          showPriceOnPhoto: showPriceOnPhoto,
        ),
      ),
    );
  }
}
