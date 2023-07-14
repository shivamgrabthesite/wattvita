import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Delay extends StatefulWidget {
  const Delay({super.key});

  @override
  State<Delay> createState() => _DelayState();
}

class _DelayState extends State<Delay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoTheme(
              data: CupertinoThemeData(
                  brightness: Brightness.dark,
                  textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 30))),
              child: Container(
                  height: 200,
                  child: CupertinoTimerPicker(
                    backgroundColor: Colors.black,
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (value) {},
                  ))),
        ],
      ),
    );
  }
}
