import 'package:flutter_test/flutter_test.dart';

import 'package:logger_beauty/logger_beauty.dart';

void main() {
  test('Debug log', () {
    logDebug("This is debug mode");
  });
}
