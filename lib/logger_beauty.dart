library logger_beauty;

import 'package:flutter/foundation.dart';
import 'package:logger_beauty/log_color.dart';

import 'log_level.dart';

void logDebug(String message,
    {LogLevel level = LogLevel.debug, String? color}) {
  // Get the current time in hours, minutes, and seconds
  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  // Only log messages if the app is running in debug mode
  if (kDebugMode) {
    try {
      String logMessage;
      switch (level) {
        case LogLevel.debug:
          logMessage =
              '${color ?? LogColor.cyan}[DEBUG][$timeString] $message ${LogColor.reset}';
          break;
        case LogLevel.info:
          logMessage =
              '${color ?? LogColor.green}[INFO][$timeString] $message ${LogColor.reset}';
          break;
        case LogLevel.warning:
          logMessage =
              '${color ?? LogColor.yellow}[WARNING][$timeString] $message ${LogColor.reset}';
          break;
        case LogLevel.error:
          logMessage =
              '${color ?? LogColor.red}[ERROR][$timeString] $message ${LogColor.reset}';
          break;
        case LogLevel.unknown:
          logMessage =
              '${color ?? LogColor.red}[UNKNOWN][$timeString] $message ${LogColor.reset}';
          break;
      }
      debugPrint(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}
