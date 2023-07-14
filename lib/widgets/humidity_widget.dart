import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/Humidity.dart';

class HumidityWidget extends StatefulWidget {
  const HumidityWidget({super.key});

  @override
  State<HumidityWidget> createState() => _HumidityWidgetState();
}

class _HumidityWidgetState extends State<HumidityWidget> {
  bool? dry, comfortable, moist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHumidity();
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

  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
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
                setState(
                  () {
                    situationProvider.humidity = true;
                    // situationProvider.listOfWidget.removeAt(situationProvider.index);
                    situationProvider.removeWidget(situationProvider.index);
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
}
