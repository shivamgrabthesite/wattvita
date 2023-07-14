import 'package:flutter/cupertino.dart';

class SunsetSunriseProvider with ChangeNotifier {
  bool isSunrise = false;
  String sunriseName = '';
  List<String> sunriseList = [
    "5 hour before sunrise",
    "4 hour before sunrise",
    "3 hour before sunrise",
    "2 hour before sunrise",
    "1 hour before sunrise",
    "55 minutes before sunrise",
    "50 minutes before sunrise",
    "45 minutes before sunrise",
    "40 minutes before sunrise",
    "35 minutes before sunrise",
    "30 minutes before sunrise",
    "25 minutes before sunrise",
    "20 minutes before sunrise",
    "15 minutes before sunrise",
    "10 minutes before sunrise",
    "5 minutes before sunrise",
    "Sunrise",
    "5 minutes after sunrise",
    "10 minutes after sunrise",
    "15 minutes after sunrise",
    "20 minutes after sunrise",
    "25 minutes after sunrise",
    "30 minutes after sunrise",
    "35 minutes after sunrise",
    "40 minutes after sunrise",
    "45 minutes after sunrise",
    "50 minutes after sunrise",
    "55 minutes after sunrise",
    "1 hour after sunrise",
    "2 hour after sunrise",
    "3 hour after sunrise",
    "4 hour after sunrise",
    "5 hour after sunrise"
  ];
  int indexSunrise = 0;

  bool isSunset = false;
  String sunsetName = '';
  List<String> sunsetList = [
    "5 hour before sunset",
    "4 hour before sunset",
    "3 hour before sunset",
    "2 hour before sunset",
    "1 hour before sunset",
    "55 minutes before sunset",
    "50 minutes before sunset",
    "45 minutes before sunset",
    "40 minutes before sunset",
    "35 minutes before sunset",
    "30 minutes before sunset",
    "25 minutes before sunset",
    "20 minutes before sunset",
    "15 minutes before sunrise",
    "10 minutes before sunset",
    "5 minutes before sunset",
    "Sunset",
    "5 minutes after sunset",
    "10 minutes after sunset",
    "15 minutes after sunset",
    "20 minutes after sunset",
    "25 minutes after sunset",
    "30 minutes after sunset",
    "35 minutes after sunset",
    "40 minutes after sunset",
    "45 minutes after sunset",
    "50 minutes after sunset",
    "55 minutes after sunset",
    "1 hour after sunset",
    "2 hour after sunset",
    "3 hour after sunset",
    "4 hour after sunset",
    "5 hour after sunset"
  ];
  int indexSunset = 0;
}
