import 'dart:convert';

import 'package:dio/dio.dart';

import 'log_level.dart';
import 'logger_beauty.dart';

class LoggerInterceptor extends Interceptor {
  final _lineChar =
      '_______________________________________________________________________';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log the error request and error message
    logDebug('onError: ${options.method} request => $requestPath',
        level: LogLevel.error);
    logDebug('onError: ${err.error}, Message: ${err.message}',
        level: LogLevel.debug);
    logDebug(_lineChar);
    logDebug('\n');
    return super.onError(err, handler);
  }

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

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug(
        'onResponse: StatusCode: ${response.statusCode}, Data: ${_prettyJsonEncode(response.data)}',
        level: LogLevel.debug); // Log formatted response data
    logDebug(_lineChar);
    logDebug('\n');
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
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
