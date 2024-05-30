import 'package:flutter/material.dart';

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

  void pop() {
    return Navigator.of(this).pop();
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
