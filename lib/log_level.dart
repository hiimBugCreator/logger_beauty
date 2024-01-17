/// **[LogLevel]** : Type of logger.
/// Categorizing messages based on their severity and importance.
enum LogLevel {
  /// Used for detailed debugging information, typically intended for developers.
  debug,

  /// Used for general informational messages, providing context about
  /// application execution and events.
  info,

  /// Used to indicate potential issues or unexpected conditions that might
  /// require attention, but do not necessarily prevent normal operation.
  warning,

  /// Used to signal critical errors that have occurred and may have
  /// interrupted or hindered the application's functionality.
  error,

  /// Used for messages that do not fall into the other categories,
  /// potentially indicating unrecognized log levels or errors.
  unknown
}
