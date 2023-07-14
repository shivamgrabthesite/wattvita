import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/Temperature.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  bool? greater, less, equal;
  double? tempValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTempetature();
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

  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
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
                    situationProvider.temperature = true;
                    // value.listOfWidget.removeAt(value.index);
                    situationProvider.removeWidget(situationProvider.index);
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
}
