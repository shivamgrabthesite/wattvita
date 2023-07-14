import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  bool? Sunny, Cloudy, Snowy, Rainy, Hazy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
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

  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
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
                setState(
                  () {
                    situationProvider.weather = true;
                    // situationProvider.listOfWidget.removeAt(situationProvider.index);
                    situationProvider.removeWidget(situationProvider.index);
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
}
