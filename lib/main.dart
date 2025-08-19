import 'package:alawaly_app/core/routes/routes_generator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:alawaly_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Alawaly',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: PageRouteName.splashRoute,
          onGenerateRoute: RoutesGenerator.onGenerateRoutes,
        );
      },
    );
  }
}
