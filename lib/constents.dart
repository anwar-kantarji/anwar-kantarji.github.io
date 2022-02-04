class Constents {
  static List<String> getYears() {
    List<String> years = [];
    for (int i = 1920; i <= 2022; i++) years.add(i.toString());
    return years;
  }


  static List<String> getMonths() {
    List<String> months = [];
    for (int i = 1; i <= 12; i++) months.add(i.toString());
    return months;
  }

  static List<String> getDays() {
    List<String> days = [];
    for (int i = 1; i <= 31; i++) days.add(i.toString());
    return days;
  }
}
