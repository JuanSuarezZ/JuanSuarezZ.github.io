import 'package:logger/logger.dart';

class AppLogger {
  var logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        colors: true,
        // noBoxingByDefault: true,
        // excludeBox: {
        //   Level.trace: false,
        //   Level.info: false,
        // },
        levelColors: {
          Level.info: const AnsiColor.fg(247),
          Level.error: const AnsiColor.fg(168),
          Level.debug: const AnsiColor.fg(45),
          Level.warning: const AnsiColor.fg(208),
        },
        excludePaths: [],
        dateTimeFormat: DateTimeFormat.none,
      ),
    ),
  );

  AppLogger._privateConstructor();

  static final AppLogger _instance = AppLogger._privateConstructor();

  factory AppLogger() {
    return _instance;
  }

  void logInfo(String message) {
    logger.i(message);
  }

  void logError(String message) {
    logger.e(message);
  }

  void logDebug(String message) {
    logger.d(message);
  }

  void logWarning(String message) {
    logger.w(message);
  }
}
