import 'package:flutter/material.dart';

class AddResponseProvider with ChangeNotifier {
  bool SmartScene = true;
  bool tableLamp = true;
  bool SendNotificaton = true;
  bool DelayAction = true;
  void onResponseClick() {
    if (SmartScene == false) {
      SmartScene = true;
      tableLamp = false;
      SendNotificaton = false;
      DelayAction = false;
    } else if (tableLamp == false) {
      SmartScene = false;
      tableLamp = true;
      SendNotificaton = false;
      DelayAction = false;
    } else if (SendNotificaton == false) {
      SmartScene = false;
      tableLamp = false;
      SendNotificaton = true;
      DelayAction = false;
    } else if (DelayAction == false) {
      SmartScene = false;
      tableLamp = false;
      SendNotificaton = false;
      DelayAction = true;
    }
  }

  void closeAll() {
    if (SmartScene == false) {
      SmartScene = true;
    }
    if (tableLamp == false) {
      tableLamp = true;
    }
    if (SendNotificaton == false) {
      SendNotificaton = true;
    }
    if (DelayAction == false) {
      DelayAction = true;
    }
  }
}
