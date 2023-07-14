import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/weather.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/wind_control.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/notification_badge.dart';
import 'Humidity.dart';
import 'SunsetSunrise.dart';
import 'Temperature.dart';

class WeatherChange extends StatefulWidget {
  const WeatherChange({super.key});

  @override
  State<WeatherChange> createState() => _WeatherChangeState();
}

class _WeatherChangeState extends State<WeatherChange> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Weather Change",
                style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Temperature();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Temperature.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Temperature",
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Humidity();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Humidity.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Humidity",
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Weather();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Weather.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Weather",
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SunsetSunrise();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/SunsetSunrise.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sunset/Sunrise",
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return WindControl();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/Wind Control.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Wind Control",
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
