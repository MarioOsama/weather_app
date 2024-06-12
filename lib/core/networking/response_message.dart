import 'package:weather_app/core/helpers/app_string.dart';

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String LOCATION_PERMISSION_DENIED =
      AppStrings.locationPermissionDeniedError;
  static const String DEFAULT = AppStrings.defaultError;
  static const String INVALID_CITY_NAME = AppStrings.invalidCityNameError;
}
