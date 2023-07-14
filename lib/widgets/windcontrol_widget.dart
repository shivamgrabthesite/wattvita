import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/wind_control.dart';

class WindcontrolWidget extends StatefulWidget {
  const WindcontrolWidget({super.key});

  @override
  State<WindcontrolWidget> createState() => _WindcontrolWidgetState();
}

class _WindcontrolWidgetState extends State<WindcontrolWidget> {
  bool? greaterWind, lessWind, equalWind;
  double? tempValueWind;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WindControl(),
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
                setState(
                  () {
                    situationProvider.windcontrol = true;
                    // situationProvider.listOfWidget.removeAt(situationProvider.index);
                    situationProvider.removeWidget(situationProvider.index);
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
}
