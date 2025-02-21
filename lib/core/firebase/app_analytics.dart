import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'navigator_observer.dart';

class AppAnalytics {
  // Instancia única del singleton
  static final AppAnalytics _instance = AppAnalytics._internal();

  // Constructor privado
  AppAnalytics._internal();

  // Método factory que devuelve la instancia única
  factory AppAnalytics() {
    return _instance;
  }

  /// [custom navigator observer]
  final CustomNavigatorObserver customObserver = CustomNavigatorObserver();

  /// [firebase navigator observer]
  final FirebaseAnalyticsObserver navigatorObserver =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  Future<void> init() async {

    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    if (!kIsWeb) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      loadErrorLogEvents();
    }
  }

  void loadErrorLogEvents() {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  Future<void> logTest() async {
    await FirebaseAnalytics.instance.logEvent(name: "test_event");
  }

  Future<void> logErrorTest() async {
    await FirebaseCrashlytics.instance.recordError(
      "Error Test ${Platform.operatingSystem}",
      StackTrace.current,
      fatal: true,
    );
  }
}
