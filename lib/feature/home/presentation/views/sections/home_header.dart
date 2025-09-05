import '../../../../../core/resources/app_imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppSvgAssetsManager.lineIcon,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.profileRoute);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: SvgPicture.asset(
                        AppSvgAssetsManager.profileIcon,
                        height: 2.5.h,
                        // ignore: deprecated_member_use
                        color: ColorManager.grey2,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.3.w,
                      vertical: 0.6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      color: const Color.fromARGB(255, 80, 78, 78),
                    ),
                    child: SvgPicture.asset(
                      AppSvgAssetsManager.notificationIcon,
                      height: 3.h,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                AppSvgAssetsManager.splashPhoto,
                height: 10.h,
                width: 50.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
