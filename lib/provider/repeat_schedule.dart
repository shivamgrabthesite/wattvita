import 'package:flutter/material.dart';

class RepeatSchedule with ChangeNotifier {
  // bool Sunday = false;
  // bool Monday = false;
  // bool Tuesday = false;
  // bool Wednesday = false;
  // bool Thursday = false;
  // bool Friday = false;
  // bool Saturday = false;
  Map<String, bool> days = {
    'Sunday': false,
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
  };
}
