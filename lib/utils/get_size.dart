import 'package:flutter/material.dart';

Size getSize(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  if (size.height > 640) {
    height = 640;
  }
  if (size.width > 360) {
    width = 360;
  }

  return Size(width, height);
}

String getMonthString(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}

String calc(DateTime join, DateTime? releive) {
  DateTime now = releive ?? DateTime.now();

  int years = now.year - join.year;
  int months = now.month - join.month;
  int days = now.day - join.day;

  if (months < 0 || (months == 0 && days < 0)) {
    years--;
    months += (days < 0 ? 11 : 12);
  }

  // if (days < 0) {
  //   final monthAgo = DateTime(now.year, now.month - 1, birthDate.day);
  //   days = now.difference(monthAgo).inDays + 1;
  // }

  String str = '';
  if (years > 0) {
    str = '$years y';
  }
  if (months > 0) {
    str = '$str $months m';
  }
  return str;
}

Map<String, int> overAllExpCalc() {
  DateTime join = DateTime(2016, 08, 10);
  DateTime now = DateTime.now();

  int years = now.year - join.year;
  int months = now.month - join.month;
  int days = now.day - join.day;

  if (months < 0 || (months == 0 && days < 0)) {
    years--;
    months += (days < 0 ? 11 : 12);
  }

  if (days < 0) {
    final monthAgo = DateTime(now.year, now.month - 1, join.day);
    days = now.difference(monthAgo).inDays + 1;
  }

  return {'Years': years, 'Months': months, 'Days': days};
}
