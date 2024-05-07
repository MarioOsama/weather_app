class SearchResultModel {
  final String cityName;
  final String temp;
  final String weatherCondition;
  final String high;
  final String low;

  const SearchResultModel(
      {required this.cityName,
      required this.temp,
      required this.weatherCondition,
      required this.high,
      required this.low});
}
