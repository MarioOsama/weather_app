import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/routing/app_routes.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.search);
      },
      child: Icon(
        Icons.search,
        color: color,
        size: 30,
      ),
    );
  }
}
