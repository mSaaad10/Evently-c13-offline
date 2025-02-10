// import 'package:intl/intl.dart';
//
//
//
// String formatDate(DateTime date){
//   DateFormat formatted = DateFormat("dd-MM-yyy");
//   return formatted.format(date);
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String get toDateFormat => "$day / $month / $year";

  String get toMonthName {
    DateFormat formatted = DateFormat('MMMM');
    return formatted.format(this);
  }
}

extension TimeFormat on TimeOfDay {
  String get toFormattedTime => "${hour - 12}:${minute} ${period.name}";
}

String getMonthName(int monthNumber) {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return months[monthNumber - 1];
}
