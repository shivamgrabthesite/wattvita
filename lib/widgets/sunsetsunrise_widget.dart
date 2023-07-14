import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/add_situation_provider.dart';
import '../screens/Scene/weather change/SunsetSunrise.dart';

class SunsetSunriseWidget extends StatefulWidget {
  const SunsetSunriseWidget({super.key});

  @override
  State<SunsetSunriseWidget> createState() => _SunsetSunriseWidgetState();
}

class _SunsetSunriseWidgetState extends State<SunsetSunriseWidget> {
  String sunriseName = '';
  String sunsetName = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSunsetSunrise();
  }

  void getSunsetSunrise() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      sunriseName = prefs.getString("sunriseName").toString();
      sunsetName = prefs.getString("sunsetName").toString();
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
    var situationProvider = Provider.of<AddSituationProvider>(context);
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
                setState(
                  () {
                    situationProvider.sunsetsunrise = true;
                    // situationProvider.listOfWidget.removeAt(situationProvider.index);
                    situationProvider.removeWidget(situationProvider.index);
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
}
