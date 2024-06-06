class WeeklyConditionItemModel {
  final String date;
  final double highestTemp;
  final double lowestTemp;

  const WeeklyConditionItemModel({
    required this.date,
    required this.highestTemp,
    required this.lowestTemp,
  });

  String get getDate {
    final List<String> splittedDate = date.split('-');
    return '${splittedDate[2]}/${splittedDate[1]}';
  }
}
