import 'package:alawaly_app/core/resources/app_assets_manager.dart';
import 'package:alawaly_app/core/resources/app_color_manager.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.1,
      end: 3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRouteName.signUpRoute);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: SvgPicture.asset(
            AppSvgAssetsManager.splashLogo,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
