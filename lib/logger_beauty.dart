library logger_beauty;

import 'package:flutter/foundation.dart';

import 'log_level.dart';

void logDebug(String message, {LogLevel level = LogLevel.debug}) {
  // Define ANSI escape codes for different colors
  const String resetColor = '\x1B[0m';
  const String redColor = '\x1B[31m'; // Red
  const String greenColor = '\x1B[32m'; // Green
  const String yellowColor = '\x1B[33m'; // Yellow
  const String blueColor = '\x1B[34m';
  const String magentaColor = '\x1B[35m';
  const String cyanColor = '\x1B[36m'; // Cyan
  const String whiteColor = '\x1B[37m'; // Cyan
  const String lightRedColor = '\x1B[91m'; // Red
  const String lightGreenColor = '\x1B[92m'; // Green
  const String lightYellowColor = '\x1B[93m'; // Yellow
  const String lightBlueColor = '\x1B[94m';
  const String lightMagentaColor = '\x1B[95m';
  const String lightCyanColor = '\x1B[96m'; // Cyan
  const String lightWhiteColor = '\x1B[97m'; // Cyan

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
          logMessage = '$cyanColor[DEBUG][$timeString] $message$resetColor';
          break;
        case LogLevel.info:
          logMessage = '$greenColor[INFO][$timeString] $message$resetColor';
          break;
        case LogLevel.warning:
          logMessage =
              '$yellowColor[WARNING][$timeString] $message $resetColor';
          break;
        case LogLevel.error:
          logMessage = '$redColor[ERROR][$timeString] $message $resetColor';
          break;
        case LogLevel.unknown:
          logMessage = '$redColor[UNKNOWN][$timeString] $message $resetColor';
          break;
      }
      debugPrint(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}
