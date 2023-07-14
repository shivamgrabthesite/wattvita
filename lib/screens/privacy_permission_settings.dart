import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';

class PrivacyPermissionSettings extends StatefulWidget {
  const PrivacyPermissionSettings({super.key});

  @override
  State<PrivacyPermissionSettings> createState() => _PrivacyPermissionSettingsState();
}

class _PrivacyPermissionSettingsState extends State<PrivacyPermissionSettings> {
  bool reverseSwitch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Privacy Permission Settings",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Service Upkeep and Improvement Effort",
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    FlutterSwitch(
                      value: reverseSwitch,
                      width: 50,
                      height: 26,
                      inactiveColor: reverseSwitch ? Colors.black : Colors.white,
                      inactiveSwitchBorder: Border.all(
                        color: reverseSwitch ? Colors.white : Colors.black,
                      ),
                      inactiveToggleColor: Colors.black,
                      activeColor: Colors.black,
                      activeSwitchBorder: Border.all(
                        color: Colors.white,
                      ),
                      activeToggleColor: Colors.yellow,
                      onToggle: (value) {
                        setState(() {
                          reverseSwitch = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We would like to gather data regarding the usage of our product. Disabling permissions will not affect essential functionalities.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Notifications",
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "On",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Receive device alerts, system notifications, and other messages.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Location",
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "On",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Receive device alerts, system notifications, and other messages.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Access storage permission",
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "On",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Receive device alerts, system notifications, and other messages.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Camera",
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "On",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Receive device alerts, system notifications, and other messages.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Access to  nearby device \npermissions",
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      "On",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Receive device alerts, system notifications, and other messages.",
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
                Divider(
                  color: Color.fromRGBO(105, 105, 105, 1),
                  thickness: 1,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
