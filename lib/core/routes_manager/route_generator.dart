
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/register/register_screen.dart';
import '../resources/constants_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppConstants.notFoundPage),
              ),
              body: const Center(child: Text(AppConstants.notFoundPage)),
            ));
  }
}