import 'package:evently_c13_offline/config/theme/app_theme.dart';
import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/core/routes_manager/routes_manager.dart';
import 'package:flutter/material.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.getRoute,
      initialRoute: Routes.mainLayOut,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
