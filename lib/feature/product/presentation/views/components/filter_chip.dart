import '../../../../../core/resources/app_imports.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersChip extends StatelessWidget {
  final String label;
  final String icon;
  final int index;
  final bool isSelected;
  final Function(int) onSelected;

  const FiltersChip({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        onSelected(index);
        final position = details.globalPosition;
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy,
            position.dx,
            position.dy,
          ),
          items: const [
            PopupMenuItem(child: Text("الخيار الأول")),
            PopupMenuItem(child: Text("الخيار الثاني")),
            PopupMenuItem(child: Text("الخيار الثالث")),
          ],
        );
      },
      child: Container(
        height: 5.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.primaryColor
              : const Color.fromARGB(255, 78, 72, 70),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: isSelected ? ColorManager.white : Colors.transparent,
              ),
              padding: isSelected ? EdgeInsets.all(1.w) : EdgeInsets.zero,
              child: SvgPicture.asset(
                icon,
                height: 1.h,
                // ignore: deprecated_member_use
                color: isSelected
                    ? ColorManager.primaryColor
                    : ColorManager.white,
              ),
            ),
            SizedBox(width: 3.w),
            Text(label, style: GoogleFonts.cairo(color: ColorManager.white)),
          ],
        ),
      ),
    );
  }
}
