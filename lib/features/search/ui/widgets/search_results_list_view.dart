import 'package:flutter/material.dart';
import 'package:weather_app/features/search/data/models/search_result_model.dart';
import 'package:weather_app/features/search/ui/widgets/search_result_card.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    super.key,
  });

  static const List<SearchResultModel> searchResults = [
    SearchResultModel(
      cityName: 'London',
      temp: '20',
      weatherCondition: 'Mid Rain',
      high: '24',
      low: '18',
    ),
    SearchResultModel(
      cityName: 'New York',
      temp: '25',
      weatherCondition: 'Sunny',
      high: '28',
      low: '22',
    ),
    SearchResultModel(
      cityName: 'Paris',
      temp: '22',
      weatherCondition: 'Cloudy',
      high: '25',
      low: '20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SearchResultCard(
          result: searchResults[index],
          index: index.toDouble(),
        ),
      ),
    );
  }
}
