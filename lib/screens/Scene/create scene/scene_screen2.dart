import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:flutter_wattvita/screens/Scene/tap%20to%20run/one_tap_control.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/tap_to_run.dart';
import '../weather change/weather_change.dart';

class SceneScreen2 extends StatefulWidget {
  const SceneScreen2({super.key});

  @override
  State<SceneScreen2> createState() => _SceneScreen2State();
}

class _SceneScreen2State extends State<SceneScreen2> {
  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Scene",
                style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    situationProvider.listOfWidget.add(TapToRun());
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return OneTapControl();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/taptorun.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Tap-To-Run",
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
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return WeatherChange();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/weatherchange.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Weather Change",
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
                height: 22,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/location.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Location Change",
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
                height: 22,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/timer1.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Schedule",
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
                height: 22,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/civic.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Device Status Change",
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
