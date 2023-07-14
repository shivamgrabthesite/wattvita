import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:flutter_wattvita/screens/Scene/tap%20to%20run/one_tap_control.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/temperature_widget.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  double _value = -40;
  bool greater = false;
  bool equal = false;
  bool less = false;
  String? city;
  String? sign;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      greater = prefs.getBool("greater")!;
      equal = prefs.getBool("equal")!;
      less = prefs.getBool("less")!;
      _value = prefs.getDouble("_value")!;
    });
  }

  void sharedpref() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("greater", greater);
    prefs.setBool("equal", equal);
    prefs.setBool("less", less);
    prefs.setDouble("_value", _value);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddSituationProvider>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Temperature",
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
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _value.toInt().toString(),
                      style: GoogleFonts.redHatDisplay(fontSize: 80, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "°C",
                      style: GoogleFonts.redHatDisplay(fontSize: 44, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SfSliderTheme(
                  data: SfSliderThemeData(
                    activeLabelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    inactiveLabelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  child: SfSlider(
                    inactiveColor: Color.fromRGBO(60, 60, 67, 0.18),
                    value: _value,
                    min: -40,
                    max: 40,
                    interval: 10,
                    showDividers: true,
                    activeColor: Colors.black,
                    showLabels: true,
                    labelFormatterCallback: (actualValue, formattedText) {
                      return '$formattedText°C';
                    },
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (less == true) {
                            less = false;
                          } else {
                            less = true;
                            equal = false;
                            greater = false;
                          }
                        });
                      },
                      child: Container(
                        width: less == false ? 60 : width / 2.6,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 0.8)),
                        child: Center(
                            child: less == false
                                ? Text(
                                    "<",
                                    style: TextStyle(color: Colors.black, fontSize: 40),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "<",
                                          style: TextStyle(color: Colors.black, fontSize: 40),
                                        ),
                                        SizedBox(
                                          width: width / 30,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "If temperature drop",
                                            style: TextStyle(color: Colors.black, fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (equal == true) {
                            equal = false;
                          } else {
                            equal = true;
                            less = false;
                            greater = false;
                          }
                        });
                      },
                      child: Container(
                          width: equal == false ? 60 : width / 2.6,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 0.8)),
                          child: Center(
                              child: equal == false
                                  ? Text(
                                      "=",
                                      style: TextStyle(color: Colors.black, fontSize: 40),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            "=",
                                            style: TextStyle(color: Colors.black, fontSize: 40),
                                          ),
                                          SizedBox(
                                            width: width / 30,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "If temperature equal",
                                              style: TextStyle(color: Colors.black, fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (greater == true) {
                            greater = false;
                          } else {
                            greater = true;
                            equal = false;
                            less = false;
                          }
                        });
                      },
                      child: Container(
                        width: greater == false ? 60 : width / 2.6,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 0.8)),
                        child: Center(
                            child: greater == false
                                ? Text(
                                    ">",
                                    style: TextStyle(color: Colors.black, fontSize: 40),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "If temperature increase",
                                            style: TextStyle(color: Colors.black, fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 30,
                                        ),
                                        Text(
                                          ">",
                                          style: TextStyle(color: Colors.black, fontSize: 40),
                                        ),
                                      ],
                                    ),
                                  )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        if (less == false && equal == false && greater == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("select sign")));
                        } else {
                          if (provider.temperature == true) {
                            setState(() {
                              provider.temperature = false;
                              provider.listOfWidget.add(TemperatureWidget());
                            });
                          }
                          sharedpref();
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
}
