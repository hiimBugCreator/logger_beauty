/*
This class is reference from: https://ss64.com/nt/syntax-ansi.html
*/

///  Class for defining color codes used for terminal output formatting.
class LogColor {
  /// Resets all color formatting to the terminal's default.
  static const String reset = '\x1B[0m';

  // Bold color codes for emphasis:

  /// Red text for highlighting errors or warnings.
  static const String red = '\x1B[31m';

  /// Green text for indicating success or positive information.
  static const String green = '\x1B[32m';

  /// Yellow text for drawing attention or highlighting potential issues.
  static const String yellow = '\x1B[33m';

  /// Blue text for general information or non-critical messages.
  static const String blue = '\x1B[34m';

  /// Magenta text for diverse purposes or custom highlighting.
  static const String magenta = '\x1B[35m';

  /// Cyan text for additional information or visual distinction.
  static const String cyan = '\x1B[36m';

  /// White text for readability on dark backgrounds or custom highlighting.
  static const String white = '\x1B[37m';

  //Lighter color variants for subtler emphasis:

  /// Light red text for less prominent error or warning messages.
  static const String lightRed = '\x1B[91m';

  /// Light green text for less prominent success or positive messages.
  static const String lightGreen = '\x1B[92m';

  /// Light yellow text for less prominent attention-drawing or highlighting.
  static const String lightYellow = '\x1B[93m';

  /// Light blue text for less prominent general information or messages.
  static const String lightBlue = '\x1B[94m';

  /// Light magenta text for less prominent custom highlighting or purposes.
  static const String lightMagenta = '\x1B[95m';

  /// Light cyan text for less prominent additional information or distinction.
  static const String lightCyan = '\x1B[96m';

  /// Light white text for less prominent emphasis on dark backgrounds.
  static const String lightWhite = '\x1B[97m';
}
