import 'package:flutter/material.dart';

class WeatherDetailsItemModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? footerText;
  final double? barPercentage;

  const WeatherDetailsItemModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.barPercentage,
      this.footerText});
}
