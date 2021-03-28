import 'dart:core';

class AgeCalculator {
  final int year;
  final int month;
  final int day;
  final int totalDay;

  AgeCalculator({this.year, this.month, this.day, this.totalDay});

  int monthsToDays(int tMonth, int tYear) {
    if (tMonth == 1 ||
        tMonth == 3 ||
        tMonth == 5 ||
        tMonth == 7 ||
        tMonth == 8 ||
        tMonth == 10 ||
        tMonth == 12) {
      return 31;
    } else if (tMonth == 2) {
      if (tYear % 4 == 0) {
        return 29;
      } else {
        return 28;
      }
    } else {
      return 30;
    }
  }

  AgeCalculator calculateAge(DateTime startDate) {
    DateTime mycal1 = startDate;
    DateTime mycal2 = DateTime.now();

    int mDay = mycal1.day;
    int mMonth = mycal1.month;
    int mYear = mycal1.year;

    int tDay = mycal2.day;
    int tMonth = mycal2.month;
    int tYear = mycal2.year;

    int totalDays = mycal2.difference(mycal1).inDays;
    int mYearDiff = tYear - mYear;
    int mMonDiff = tMonth - mMonth;

    if (mMonDiff < 0) {
      mYearDiff = mYearDiff - 1;
      mMonDiff = mMonDiff + 12;
    }

    int mDayDiff = tDay - mDay;
    if (mDayDiff < 0) {
      if (mMonDiff > 0) {
        mMonDiff = mMonDiff - 1;
        mDayDiff = mDayDiff + monthsToDays(tMonth - 1, tYear);
      } else {
        mYearDiff = mYearDiff - 1;
        mMonDiff = 11;
        mDayDiff = mDayDiff + monthsToDays(tMonth - 1, tYear);
      }
    }
    return new AgeCalculator(
        year: mYearDiff, month: mMonDiff, day: mDayDiff, totalDay: totalDays);
  }
}
