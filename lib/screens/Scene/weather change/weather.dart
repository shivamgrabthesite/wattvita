import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/notification_badge.dart';
import '../../../widgets/weather_widget.dart';
import '../tap to run/one_tap_control.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  bool Sunny = false;
  bool Cloudy = false;
  bool Snowy = false;
  bool Rainy = false;
  bool Hazy = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void setData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("Sunny", Sunny);
      prefs.setBool("Cloudy", Cloudy);
      prefs.setBool("Snowy", Snowy);
      prefs.setBool("Rainy", Rainy);
      prefs.setBool("Hazy", Hazy);
    });
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      Sunny = prefs.getBool("Sunny")!;
      Cloudy = prefs.getBool("Cloudy")!;
      Snowy = prefs.getBool("Snowy")!;
      Rainy = prefs.getBool("Rainy")!;
      Hazy = prefs.getBool("Hazy")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddSituationProvider>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Weather",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
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
                          "Current City",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Text("Ahmedabad",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.inter(fontSize: 12, color: Colors.black)),
                        const Icon(
                          CupertinoIcons.forward,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Sunny = !Sunny;
                      if (Sunny == true) {
                        Cloudy = false;
                        Snowy = false;
                        Rainy = false;
                        Hazy = false;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "Sunny",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Sunny == true ? Colors.white : Colors.black,
                              size: 18,
                            ),
                          ),
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
                    setState(() {
                      Cloudy = !Cloudy;
                      if (Cloudy == true) {
                        Sunny = false;
                        Snowy = false;
                        Rainy = false;
                        Hazy = false;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "Cloudy",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Cloudy == true ? Colors.white : Colors.black,
                              size: 18,
                            ),
                          ),
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
                    setState(() {
                      Snowy = !Snowy;
                      if (Snowy == true) {
                        Sunny = false;
                        Cloudy = false;
                        Rainy = false;
                        Hazy = false;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "Snowy",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Snowy == true ? Colors.white : Colors.black,
                              size: 18,
                            ),
                          ),
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
                    setState(() {
                      Rainy = !Rainy;
                      if (Rainy == true) {
                        Cloudy = false;
                        Snowy = false;
                        Sunny = false;
                        Hazy = false;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "Rainy",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Rainy == true ? Colors.white : Colors.black,
                              size: 18,
                            ),
                          ),
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
                    setState(() {
                      Hazy = !Hazy;
                      if (Hazy == true) {
                        Cloudy = false;
                        Snowy = false;
                        Rainy = false;
                        Sunny = false;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "Hazy",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Hazy == true ? Colors.white : Colors.black,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 16,
                ),
                Container(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        if (Cloudy == false &&
                            Sunny == false &&
                            Snowy == false &&
                            Rainy == false &&
                            Hazy == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("select one atleast option")));
                        } else {
                          setState(() {
                            if (provider.weather == true) {
                              provider.weather = false;
                              // provider.index.add('weather');
                              // provider.checkWeather();
                              provider.listOfWidget.add(WeatherWidget());
                            }
                          });
                          setData();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return OneTapControl();
                            },
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Next",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> discardDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 340,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    height: 210,
                    width: 280,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Discard Changes ?",
                          style: GoogleFonts.redHatDisplay(
                              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "No problem, you can easily discard any changes and go back",
                          style: GoogleFonts.inter(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 35,
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      side: BorderSide(
                                        color: Colors.black,
                                      )),
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.nunito(color: Colors.black, fontSize: 12),
                                  )),
                            ),
                            Spacer(),
                            Container(
                              width: 120,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Text(
                                    "Discard",
                                    style: GoogleFonts.nunito(color: Colors.white, fontSize: 12),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset("assets/images/discard.svg")),
              ],
            ),
          ),
        );
      },
    );
  }
}
