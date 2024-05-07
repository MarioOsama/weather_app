import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/widgets/custom_app_bar.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/features/search/ui/widgets/search_results_list_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: <Widget>[
          const CustomAppBar(title: 'Search'),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomTextField(),
          ),
          verticalSpace(20),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SearchResultsListView(),
            ),
          ),
        ],
      ),
    ));
  }
}
