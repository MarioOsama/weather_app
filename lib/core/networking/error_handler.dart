import 'package:dio/dio.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/networking/connection_status.dart';
import 'package:weather_app/core/networking/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = ConnectionStatus.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ConnectionStatus.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return ConnectionStatus.DEFAULT.getFailure();
      }
    default:
      return ConnectionStatus.DEFAULT.getFailure();
  }
}
