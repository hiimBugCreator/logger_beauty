# logger_beauty

**Bring clarity and visual appeal to your logs with logger_beauty!**

This Dart library empowers you with:

- **Color-coded logging:** Visually distinguish messages based on their importance with vibrant
  colors.
- **Timestamps:** Easily track the sequence of events with clear timestamps.
- **Customizable levels:** Categorize messages using different log levels (debug, info, warning,
  error, unknown).
- **Optional colors:** Highlight specific messages with custom colors for added emphasis.
- **Debug mode awareness:** Logs messages only in debug mode, keeping production environments clean.

**Key features:**

- Simple API for easy integration into your projects.
- Works seamlessly with Flutter's `debugPrint` function.
- Supports custom formatting for tailored logging experiences.
- Ideal for debugging, monitoring, and understanding application behavior.

**Installation:**

Add the library to your `pubspec.yaml` file:

```yaml
dependencies:
  logger_beauty: ^1.0.0
  ```

Then run:

```shell
$ flutter pub get
```

Import the library in your Dart code:

```dart
import 'package:logger_beauty/logger_beauty.dart';
```

## Usage

```dart
import 'package:logger_beauty/logger_beauty.dart';

logDebug('This is a debug message');
logDebug('This is an info message', level: LogLevel.info);
logDebug('This is a warning message', level: LogLevel.warning, color: LogColor.yellow);

```

**Customization:**

- Define your own log levels using the LogLevel enum.
- Create custom color themes for unique visual styles.

**Integration with Dio:**

```dart
import 'package:logger_beauty/dio_logger_interceptor.dart';

final dio = Dio();
dio.interceptors.add(DioLoggerInterceptor());

```

For more examples, check out the [example](https://github.com/hiimBugCreator/logger_beauty/tree/main/example) directory.

Issues and Feedback
Please file issues or provide feedback on
our [GitHub repository](https://github.com/hiimBugCreator/logger_beauty/).
