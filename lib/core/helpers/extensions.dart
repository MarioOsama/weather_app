import 'package:flutter/material.dart';
import 'package:weather_app/core/networking/connection_status.dart';
import 'package:weather_app/core/networking/failure.dart';
import 'package:weather_app/core/networking/response_code.dart';
import 'package:weather_app/core/networking/response_message.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop([result]) {
    return Navigator.of(this).pop(result);
  }
}

extension ToTitleCase on String {
  String toTitleCase() {
    final List<String> words = this.split(' ');
    final List<String> capitalizedWords = [];
    for (final String word in words) {
      capitalizedWords.add(word[0].toUpperCase() + word.substring(1));
    }
    return capitalizedWords.join(' ');
  }
}

extension ToList on String {
  String getFirst(String separator, int numberOfWords) {
    final List<String> words = this.split(separator);
    return words.sublist(0, numberOfWords).join(separator);
  }
}

extension ConnectionStatusExtension on ConnectionStatus {
  Failure getFailure() {
    switch (this) {
      case ConnectionStatus.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case ConnectionStatus.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case ConnectionStatus.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case ConnectionStatus.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case ConnectionStatus.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case ConnectionStatus.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case ConnectionStatus.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case ConnectionStatus.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case ConnectionStatus.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case ConnectionStatus.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}
