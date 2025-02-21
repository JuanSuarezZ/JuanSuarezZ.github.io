import 'package:flutter/material.dart';
import '../core.config.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  CustomNavigatorObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    if (route.settings.name == null) return;

    AppLogger().logInfo('[CustomRouter] [Push] ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    if (route.settings.name == null) return;

    AppLogger().logInfo('[CustomRouter] [Pop] ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    try {
      if (newRoute!.settings.name == null) return;

      AppLogger().logInfo('[CustomRouter] [Replace] ${newRoute.settings.name}');
    } catch (e) {
      AppLogger().logError('[CustomRouter] [Error] [didReplace] $e');
    }
  }
}
