import 'package:english_academy_mobile/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(initTheme: ThemeData.light()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: themeProvider.currentTheme,
          title: 'English Academy Mobile',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.launchingScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
