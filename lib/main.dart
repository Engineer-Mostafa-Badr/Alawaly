import 'package:alawaly_app/core/routes/routes_generator.dart';
import '../../../../../core/resources/app_imports.dart';

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
            textTheme: TextTheme(
              titleLarge: TextStyle(fontFamily: "", fontSize: 12),
            ),
          ),
          initialRoute: PageRouteName.splashRoute,
          onGenerateRoute: RoutesGenerator.onGenerateRoutes,
        );
      },
    );
  }
}
