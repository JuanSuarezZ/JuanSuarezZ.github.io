import 'package:flutter/services.dart';
import 'package:flutterappweb/core/core.config.dart';

class NativeChannelOpener {
  static const MethodChannel _channel =
      MethodChannel('com.jdevsuarez.flutterappweb/channel');

  static Future<void> openGooglePlay(String packageName) async {
    try {
      await _channel
          .invokeMethod('openGooglePlay', {'packageName': packageName});
    } catch (e) {
      AppLogger().logInfo('Failed to open Google Play: $e');
    }
  }

  static Future<void> openGooglePlayReview(String packageName) async {
    try {
      await _channel
          .invokeMethod('openGooglePlayReview', {'packageName': packageName});
    } catch (e) {
      AppLogger().logInfo('Failed to open Google Play: $e');
    }
  }

  static Future<void> showAlarm({int milliseconds = 5000}) async {
    try {
      await _channel.invokeMethod('show_alarm', {'delay': milliseconds});
    } catch (e) {
      AppLogger().logInfo('Failed to show alarm: $e');
    }
  }

  //
}

