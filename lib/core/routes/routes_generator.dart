import 'package:alawaly_app/feature/auth/presentation/views/sign_up_view.dart';
import 'package:alawaly_app/feature/home/presentation/views/home_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/profile_view.dart';
import 'package:alawaly_app/feature/search/presentation/views/advanced_research_view.dart';
import 'package:alawaly_app/feature/search/presentation/views/search_view.dart';
import 'package:alawaly_app/feature/splash/views/splash_view.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRouteName.signUpRoute:
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case PageRouteName.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case PageRouteName.searchRoute:
        return MaterialPageRoute(
          builder: (context) => SearchView(),
          settings: settings,
        );
      case PageRouteName.advancedResearchRoute:
        return MaterialPageRoute(
          builder: (context) => AdvancedResearchView(),
          settings: settings,
        );
      case PageRouteName.profileRoute:
        return MaterialPageRoute(
          builder: (context) => ProfileView(),
          settings: settings,
        );
      // case PageRouteName.signUpSellerRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SignUpSellerView(),
      //     settings: settings,
      //   );
      // case PageRouteName.signUpUserRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SignUpUserView(),
      //     settings: settings,
      //   );
      // case PageRouteName.homeUserRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => HomeUserView(),
      //     settings: settings,
      //   );
      // case PageRouteName.homeSellerRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => HomeSellerView(),
      //     settings: settings,
      //   );
      // case PageRouteName.activateRoute:
      //   final args = settings.arguments;
      //   if (args is UserEntity) {
      //     return MaterialPageRoute(builder: (_) => ActivateView(user: args));
      //   } else {
      //     debugPrint('❗ Error: Expected UserEntity but got $args');
      //     return MaterialPageRoute(
      //       builder:
      //           (_) =>
      //               Scaffold(body: Center(child: Text("Invalid user data."))),
      //     );
      //   }
      // case PageRouteName.enterOTPRoute:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => EnterOTPView(user: args['user'], email: args['email']),
      //   );

      // case PageRouteName.onBoardingOneRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnboardingOneView(),
      //     settings: settings,
      //   );
      // case PageRouteName.onBoardingTwoRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnboardingTwoView(),
      //     settings: settings,
      //   );
      // case PageRouteName.onBoardingThreeRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnboardingThreeView(),
      //     settings: settings,
      //   );
      // case PageRouteName.profileRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfileView(),
      //     settings: settings,
      //   );
      // case PageRouteName.editProfileRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const EditProfileView(),
      //     settings: settings,
      //   );

      // case PageRouteName.profileOptionsRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfileOptionsView(),
      //     settings: settings,
      //   );
      // case PageRouteName.favoriteRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const FavoriteView(),
      //     settings: settings,
      //   );
      // case PageRouteName.paymentRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const PaymentView(),
      //     settings: settings,
      //   );
      // case PageRouteName.forgotPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotPassword(),
      //     settings: settings,
      //   );

      // case PageRouteName.productRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProductView(),
      //     settings: settings,
      //   );
      // case PageRouteName.chatRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ChatView(),
      //     settings: settings,
      //   );
      // case PageRouteName.stateRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const StateView(),
      //     settings: settings,
      //   );
      // // case PageRouteName.changePasswordChooseMethodRoute:
      // //   final args = settings.arguments;
      // //   if (args is UserEntity) {
      // //     return MaterialPageRoute(
      // //       builder: (context) => ChangePasswordChooseMethodView(user: args),
      // //       settings: settings,
      // //     );
      // //   } else {
      // //     return MaterialPageRoute(
      // //       builder:
      // //           (_) => const Scaffold(
      // //             body: Center(child: Text("لم يتم توفير بيانات المستخدم")),
      // //           ),
      // //     );
      // //   }
      // case PageRouteName.changePasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ChangePasswordView(),
      //     settings: settings,
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
