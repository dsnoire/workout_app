extension WeekdayAbbreviation on Iterable<String> {
  String getWeekdayAbbreviation({required int index}) =>
      elementAt(index).split('').getRange(0, 3).join();
}
