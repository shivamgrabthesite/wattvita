import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_wattvita/provider/add_response_provider.dart';
import 'package:flutter_wattvita/screens/Scene/tap%20to%20run/one_tap_control.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/appbar.dart';
import '../../widgets/notification_badge.dart';

class AllDevices extends StatefulWidget {
  const AllDevices({super.key});

  @override
  State<AllDevices> createState() => _AllDevicesState();
}

class _AllDevicesState extends State<AllDevices> {
  bool off = false;
  bool reverseSwitch = false;

  onSave(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa = await prefs.setBool("OnOff", off);
    print("on off" + aa.toString());
    // prefs.setBool("reverseSwitch", reverseSwitch);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var provider = Provider.of<AddResponseProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Device",
                style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/devices/socket2.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Socket (Wi-Fi)",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: height / 2.4,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Table Lamp",
                                    style: GoogleFonts.redHatDisplay(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/images/smsnotification1.svg"),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        off == false ? "Off" : "On",
                                        style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                                      ),
                                      Spacer(),
                                      FlutterSwitch(
                                        value: off,
                                        width: 50,
                                        height: 26,
                                        inactiveColor: Colors.black,
                                        inactiveSwitchBorder: Border.all(
                                          color: Colors.white,
                                        ),
                                        inactiveToggleColor: Colors.white,
                                        activeColor: Colors.black,
                                        activeSwitchBorder: Border.all(
                                          color: Colors.white,
                                        ),
                                        activeToggleColor: Colors.yellow,
                                        onToggle: (value) {
                                          setState.call(() {
                                            off = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/images/directnotification1.svg"),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Reverse Switch",
                                        style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                                      ),
                                      Spacer(),
                                      FlutterSwitch(
                                        value: reverseSwitch,
                                        width: 50,
                                        height: 26,
                                        inactiveColor: Colors.black,
                                        inactiveSwitchBorder: Border.all(
                                          color: Colors.white,
                                        ),
                                        inactiveToggleColor: Colors.white,
                                        activeColor: Colors.black,
                                        activeSwitchBorder: Border.all(
                                          color: Colors.white,
                                        ),
                                        activeToggleColor: Colors.yellow,
                                        onToggle: (value) {
                                          setState.call(() {
                                            reverseSwitch = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width / 2.5,
                                          height: height / 16,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8)),
                                                  side: BorderSide(
                                                    color: Colors.white.withOpacity(0.8),
                                                  )),
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.nunito(
                                                    color: Colors.white, fontSize: 16),
                                              )),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: width / 2.5,
                                          height: height / 16,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                onSave(context);
                                                if (off == false && reverseSwitch == false) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                          content:
                                                              Text("select atleast one option")));
                                                } else {
                                                  setState.call(
                                                    () {
                                                      provider.tableLamp = false;
                                                    },
                                                  );
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => OneTapControl(),
                                                  ));
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8)),
                                              ),
                                              child: Text(
                                                "Save",
                                                style: GoogleFonts.nunito(
                                                    color: Colors.black, fontSize: 16),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/devices/tablelamp.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Table Lamp",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/devices/livingroom.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Living Room",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/devices/ac.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Air Conditioner",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/devices/Refrigerator.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Refrigerator",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
