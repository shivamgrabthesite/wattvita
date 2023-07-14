import 'package:flutter/material.dart';

class AddSituationProvider with ChangeNotifier {
  bool TaptoRun = true;
  bool LocationChange = true;
  bool Schedule = true;
  bool Device = true;

  //weather change
  bool temperature = true;
  bool humidity = true;
  bool weather = true;
  bool sunsetsunrise = true;
  bool windcontrol = true;

  List<Widget> listOfWidget = [SizedBox.shrink()];
  int index = 1;

  void removeWidget(int index) {
    this.index = index;
    listOfWidget.removeAt(this.index);
    notifyListeners();
  }

  void condition() {
    if (TaptoRun == false) {
      LocationChange = true;
      Schedule = true;
      Device = true;
      temperature = true;
      humidity = true;
      weather = true;
      sunsetsunrise = true;
      windcontrol = true;
    } else if (temperature = false) {
      LocationChange = true;
      Schedule = true;
      Device = true;
      TaptoRun = true;
      humidity = true;
      weather = true;
      sunsetsunrise = true;
      windcontrol = true;
    }
  }

  void checkTemp() {
    if (TaptoRun == false ||
        humidity == false ||
        weather == false ||
        sunsetsunrise == false ||
        windcontrol == false) {
      TaptoRun = true;
      humidity = true;
      weather = true;
      sunsetsunrise = true;
      windcontrol = true;
    }
  }

  void checkHumidity() {
    if (TaptoRun == false ||
        temperature == false ||
        weather == false ||
        sunsetsunrise == false ||
        windcontrol == false) {
      TaptoRun = true;
      temperature = true;
      weather = true;
      sunsetsunrise = true;
      windcontrol = true;
    }
  }

  void checkWeather() {
    if (TaptoRun == false ||
        temperature == false ||
        humidity == false ||
        sunsetsunrise == false ||
        windcontrol == false) {
      TaptoRun = true;
      temperature = true;
      humidity = true;
      sunsetsunrise = true;
      windcontrol = true;
    }
  }

  void checkSunsetSunrise() {
    if (TaptoRun == false ||
        temperature == false ||
        humidity == false ||
        weather == false ||
        windcontrol == false) {
      TaptoRun = true;
      temperature = true;
      humidity = true;
      weather = true;
      windcontrol = true;
    }
  }

  void checkWind() {
    if (TaptoRun == false ||
        temperature == false ||
        humidity == false ||
        weather == false ||
        sunsetsunrise == false) {
      TaptoRun = true;
      temperature = true;
      humidity = true;
      weather = true;
      sunsetsunrise = true;
    }
  }

  void closeAll() {
    if (TaptoRun == false) {
      TaptoRun = true;
    }
    if (Device == false) {
      Device = true;
    }
    if (LocationChange == false) {
      LocationChange = true;
    }
    if (Schedule == false) {
      Schedule = true;
    }
    if (humidity == false) {
      humidity = true;
    }
    if (sunsetsunrise == false) {
      sunsetsunrise = true;
    }
    if (temperature == false) {
      temperature = true;
    }
    if (weather == false) {
      weather = true;
    }
    if (windcontrol == false) {
      windcontrol = true;
    }
  }
}
