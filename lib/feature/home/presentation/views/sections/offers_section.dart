import '../../../../../core/custom_widget/custom_scroll_list.dart';
import '../../../../../core/resources/app_imports.dart';
import '../components/offers_card_widget.dart';
import '../components/sections_header.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: "عروض تسويقية",
          actionText: "جميع العروض",
          onActionTap: () {
            Navigator.pushReplacementNamed(
              context,
              PageRouteName.allOffersRoute,
            );
          },
        ),
        SizedBox(height: 2.h),
        CustomScrollList(
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemCount: 5,
          itemBuilder: (context, index) => SizedBox(
            width: 93.w,
            child: OfferCardWidget(
              imageUrl: AppAssetsManager.originalImgPhoto,
              badgeText: 'عرض حصري',
              title: 'خصم 10% لفتره محدوده',
              subtitle: 'احجز وحدتك الآن واحصل على خصم حصري',
              untilText: 'متاح حتي 2 سبتمبر',
            ),
          ),
          sizeBoxHeight: 16.h,
        ),
      ],
    );
  }
}
