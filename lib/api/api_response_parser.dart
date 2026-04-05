import 'package:nonqueue_app/api/result/result.dart';

/// Parses backend JSON envelopes `{ success, value, message }` from a successful HTTP layer result.
class ApiResponseParser {
  ApiResponseParser._();

  static Result<T> parseMap<T>(
    Result<Map<String, dynamic>> httpResult,
    T Function(dynamic value) mapValue,
  ) {
    if (!httpResult.success || httpResult.data == null) {
      return Failure<T>(httpResult.message);
    }
    final map = httpResult.data!;
    if (map['success'] == true) {
      return Success<T>(mapValue(map['value']));
    }
    return Failure<T>(map['message']?.toString() ?? 'Failed');
  }

  static Result<void> parseVoid(Result<Map<String, dynamic>> httpResult) {
    if (!httpResult.success || httpResult.data == null) {
      return Failure<void>(httpResult.message);
    }
    final map = httpResult.data!;
    if (map['success'] == true) {
      return Success<void>(
        null,
        message: map['message']?.toString() ?? 'Successful',
      );
    }
    return Failure<void>(map['message']?.toString() ?? 'Failed');
  }

  static Result<void> parseVoidWithMessage(
    Result<Map<String, dynamic>> httpResult,
    String fallbackSuccessMessage,
  ) {
    if (!httpResult.success || httpResult.data == null) {
      return Failure<void>(httpResult.message);
    }
    final map = httpResult.data!;
    if (map['success'] == true) {
      return Success<void>(null, message: fallbackSuccessMessage);
    }
    return Failure<void>(map['message']?.toString() ?? 'Failed');
  }
}
