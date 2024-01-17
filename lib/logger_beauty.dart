/*
Product by Louis Vu, based on boltuix.
*/

/// Library for logging messages with formatting and colorization for visual clarity.
library logger_beauty;

import 'package:flutter/foundation.dart';
import 'package:logger_beauty/log_color.dart';

import 'log_level.dart';

/// Function for logging formatted messages with optional color and level indicators.
///
/// Logs messages to the console with the following features:
/// - Timestamp for easy tracking of message sequence.
/// - Color-coded output based on log level for visual distinction.
/// - Optional custom color for specific highlighting.
/// - Only logs messages in debug mode to avoid cluttering production environments.
void logDebug(String message,
    {LogLevel level = LogLevel.debug, String? color}) {
  // Retrieve the current time for timestamping in hours, minutes, and seconds
  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  // Conditional logging based on debug mode
  if (kDebugMode) {
    try {
      // Construct formatted log message with appropriate color and level
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
      // Print the formatted log message to the console
      debugPrint(logMessage);
    } catch (e) {
      // Handle any errors during logging
      print(e.toString());
    }
  }
}
