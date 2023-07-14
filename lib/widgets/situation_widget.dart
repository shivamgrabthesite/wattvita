import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/Humidity.dart';
import '../screens/Scene/weather change/SunsetSunrise.dart';
import '../screens/Scene/weather change/Temperature.dart';
import '../screens/Scene/weather change/weather.dart';

class SituationWidget extends StatefulWidget {
  SituationWidget({super.key});

  @override
  State<SituationWidget> createState() => _SituationWidgetState();
}

class _SituationWidgetState extends State<SituationWidget> {
  bool? greater, less, equal;
  double? tempValue;
  bool? dry, comfortable, moist;
  bool? Sunny, Cloudy, Snowy, Rainy, Hazy;
  String sunriseName = '';
  String sunsetName = '';
  bool? greaterWind, lessWind, equalWind;
  double? tempValueWind;

  @override
  void initState() {
    super.initState();
    getTempetature();
    getHumidity();
    getWeather();
    getSunsetSunrise();
    getWind();
  }

  void getWind() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      greaterWind = prefs.getBool("greaterWind");
      equalWind = prefs.getBool("equalWind");
      lessWind = prefs.getBool("lessWind");
      tempValueWind = prefs.getDouble("_valueWind");
    });
  }

  void disposeWind() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("greaterWind");
      prefs.remove("equalWind");
      prefs.remove("lessWind");
      prefs.remove("_valueWind");
    });
  }

  void getTempetature() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      greater = prefs.getBool("greater");
      equal = prefs.getBool("equal");
      less = prefs.getBool("less");
      tempValue = prefs.getDouble("_value");
    });
  }

  void disposeTemp() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("greater");
      prefs.remove("equal");
      prefs.remove("less");
      prefs.remove("_value");
    });
  }

  void getHumidity() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      dry = prefs.getBool("dry");
      comfortable = prefs.getBool("comfortable");
      moist = prefs.getBool("moist");
    });
  }

  void disposeHumidity() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("moist");
      prefs.remove("comfortable");
      prefs.remove("dry");
    });
  }

  void getWeather() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      Sunny = prefs.getBool("Sunny");
      Cloudy = prefs.getBool("Cloudy");
      Snowy = prefs.getBool("Snowy");
      Rainy = prefs.getBool("Rainy");
      Hazy = prefs.getBool("Hazy");
    });
  }

  void disposeWeather() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("Sunny");
      prefs.remove("Cloudy");
      prefs.remove("Snowy");
      prefs.remove("Rainy");
      prefs.remove("Hazy");
    });
  }

  void getSunsetSunrise() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      sunriseName = prefs.getString("sunriseName")!;
      sunsetName = prefs.getString("sunsetName")!;
    });
  }

  void disposeSunsetSunrise() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("sunriseName");
      prefs.remove("sunsetName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<AddSituationProvider>(
          builder: (context, value, child) {
            if (value.temperature == false) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Temperature(),
                  ));
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/Temperature.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Temperature",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                greater == true
                                    ? ">"
                                    : less == true
                                        ? "<"
                                        : "=",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                tempValue!.toInt().toString(),
                                style: GoogleFonts.inter(fontSize: 16),
                              )
                            ],
                          ),
                          Text(
                            "Ahmedabad",
                            style: GoogleFonts.inter(fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              value.temperature = true;
                              disposeTemp();
                            },
                          );
                        },
                        iconSize: 20,
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (value.windcontrol == false) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Temperature(),
                  ));
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/Wind Control.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Wind Control",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                greaterWind == true
                                    ? ">"
                                    : lessWind == true
                                        ? "<"
                                        : "=",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                tempValueWind!.toInt().toString(),
                                style: GoogleFonts.inter(fontSize: 16),
                              )
                            ],
                          ),
                          Text(
                            "Ahmedabad",
                            style: GoogleFonts.inter(fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState.call(
                            () {
                              value.windcontrol = true;
                              disposeWind();
                            },
                          );
                        },
                        iconSize: 20,
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (value.humidity == false) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Humidity(),
                  ));
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/Humidity.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Humidity:",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                dry == true
                                    ? "Dry"
                                    : comfortable == true
                                        ? "Comfortable"
                                        : moist == true
                                            ? "Moist"
                                            : "",
                                style: GoogleFonts.inter(fontSize: 16),
                              )
                            ],
                          ),
                          Text(
                            "Ahmedabad",
                            style: GoogleFonts.inter(fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState.call(
                            () {
                              value.humidity = true;
                              disposeHumidity();
                            },
                          );
                        },
                        iconSize: 20,
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (value.weather == false) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Weather(),
                  ));
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/Weather.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Weather:",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                Sunny == true
                                    ? "Sunny"
                                    : Cloudy == true
                                        ? "Cloudy"
                                        : Snowy == true
                                            ? "Snow"
                                            : Rainy == true
                                                ? "Rainy"
                                                : Hazy == true
                                                    ? "Hazy"
                                                    : "",
                                style: GoogleFonts.inter(fontSize: 16),
                              )
                            ],
                          ),
                          Text(
                            "Ahmedabad",
                            style: GoogleFonts.inter(fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState.call(
                            () {
                              value.weather = true;
                              disposeWeather();
                            },
                          );
                        },
                        iconSize: 20,
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (value.sunsetsunrise == false) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SunsetSunrise(),
                  ));
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/Weather.svg"),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Weather:",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                sunsetName.isNotEmpty ? sunsetName : sunriseName,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(fontSize: 10),
                              )
                            ],
                          ),
                          Text(
                            "Ahmedabad",
                            style: GoogleFonts.inter(fontSize: 12),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState.call(
                            () {
                              value.sunsetsunrise = true;
                              disposeSunsetSunrise();
                            },
                          );
                        },
                        iconSize: 20,
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
