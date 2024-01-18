import 'dart:convert';

import 'package:dio/dio.dart';

import 'log_level.dart';
import 'logger_beauty.dart';

/// Interceptor that logs HTTP requests and responses with formatting for readability.
///
/// Designed specifically for the *[Dio]* library, this interceptor enhances debugging and
/// monitoring by providing clear and structured logging of network interactions.
class DioLoggerInterceptor extends Interceptor {
  // Constant for visually separating log entries.
  final _lineChar =
      '_______________________________________________________________________';

  /// Handles errors during HTTP requests.
  ///
  /// Logs error details including request method, path, error type, and message.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log error details:
    // - Request method and path
    logDebug('onError: ${options.method} request => $requestPath',
        level: LogLevel.error);
    // - Error type and message
    logDebug('onError: ${err.error}, Message: ${err.message}',
        level: LogLevel.debug);
    logDebug(_lineChar);
    logDebug('\n');
    return super.onError(err, handler);
  }

  /// Handles HTTP requests before they are sent.
  ///
  /// Logs request details including method, path, headers, and data.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logDebug('\n');
    logDebug(_lineChar);
    logDebug('onRequest: ${options.method} request => $requestPath',
        level: LogLevel.info);
    logDebug('onRequest: Request Headers => ${options.headers}',
        level: LogLevel.info);
    logDebug('onRequest: Request Data => ${_prettyJsonEncode(options.data)}',
        level: LogLevel.info); // Log formatted request data
    logDebug('\n');
    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  /// Handles HTTP responses before they are processed.
  ///
  /// Logs response details including status code and formatted response data.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug(
        'onResponse: StatusCode: ${response.statusCode}, Data: ${_prettyJsonEncode(response.data)}',
        level: LogLevel.debug); // Log formatted response data
    logDebug(_lineChar);
    logDebug('\n');
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format for enhanced readability.
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}
