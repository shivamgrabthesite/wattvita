import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_wattvita/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class AutomationScreen extends StatefulWidget {
  const AutomationScreen({super.key});

  @override
  State<AutomationScreen> createState() => _AutomationScreenState();
}

class _AutomationScreenState extends State<AutomationScreen> {
  bool reverseSwitch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Automation",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 125,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "When",
                                style: GoogleFonts.redHatDisplay(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              const Icon(
                                CupertinoIcons.forward,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                            child: Text(
                              "Schedule : 11:22 04/05",
                              style: GoogleFonts.redHatDisplay(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            "Do",
                            style: GoogleFonts.redHatDisplay(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18, top: 8),
                                child: Text(
                                  "Send Notification",
                                  style: GoogleFonts.redHatDisplay(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                              ),
                              const Spacer(),
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
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
