import 'package:alawaly_app/feature/profile/presentation/views/create_areal_estate_marketer_account_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/interview_appointment_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/unit_tracking_details_view.dart';
import 'package:alawaly_app/feature/product/presentation/views/mortgage_calculator_view.dart';
import 'package:alawaly_app/feature/search/presentation/views/advanced_research_view.dart';
import 'package:alawaly_app/feature/product/presentation/views/product_details_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/notifications_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/contact_admin_view.dart';
import 'package:alawaly_app/feature/product/presentation/views/unit_details_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/dashboard_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/favorite_view.dart';
import 'package:alawaly_app/feature/profile/presentation/views/profile_view.dart';
import 'package:alawaly_app/feature/search/presentation/views/search_view.dart';
import 'package:alawaly_app/feature/auth/presentation/views/sign_up_view.dart';
import 'package:alawaly_app/feature/home/presentation/views/home_view.dart';
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
      case PageRouteName.interviewAppointmentRoute:
        return MaterialPageRoute(
          builder: (context) => InterviewAppointmentView(),
          settings: settings,
        );
      case PageRouteName.favoriteRoute:
        return MaterialPageRoute(
          builder: (context) => FavoriteView(),
          settings: settings,
        );
      case PageRouteName.productDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(),
          settings: settings,
        );
      case PageRouteName.unitDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => UnitDetailsView(),
          settings: settings,
        );
      case PageRouteName.mortgageCalculatorRoute:
        return MaterialPageRoute(
          builder: (context) => const MortgageCalculatorView(),
          settings: settings,
        );
      case PageRouteName.createArealEstateMarketerAccountRoute:
        return MaterialPageRoute(
          builder: (context) => const CreateArealEstateMarketerAccountView(),
          settings: settings,
        );
      case PageRouteName.notificationsRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationsView(),
          settings: settings,
        );
      case PageRouteName.dashboardRoute:
        return MaterialPageRoute(
          builder: (context) => const DashboardView(),
          settings: settings,
        );
      case PageRouteName.contactAdminRoute:
        return MaterialPageRoute(
          builder: (context) => const ContactAdminView(),
          settings: settings,
        );
      case PageRouteName.unitTrackingDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => UnitTrackingDetailsView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
