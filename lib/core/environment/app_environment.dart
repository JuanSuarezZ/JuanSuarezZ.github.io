abstract class AppEnvironment {
  AppEnvironment._();

  static const String mock = 'mock';

  static const String develop = 'develop';

  static const String staging = 'staging';

  static const String production = 'production';

  static String get current => production;
  // static String get current => staging;
  // static String get current => develop;
  // static String get current => mock;

  static bool get isProduction => current == production;
  static bool get isStaging => current == staging;
  static bool get isDevelop => current == develop;
  static bool get isLocal => current == mock;
}
