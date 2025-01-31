import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/presentation/auth/login/login.dart';
import 'package:evently_c13_offline/presentation/auth/register/register.dart';
import 'package:evently_c13_offline/presentation/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case Routes.mainLayOut:
        return MaterialPageRoute(
          builder: (context) => MAinLayOut(),
        );
      // default:
      //   return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Un defined route'),
        ),
        body: Text('Un defined route'),
      ),
    );
  }
}
