import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:flutter_wattvita/provider/sunset_sunrise_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/sunsetsunrise_widget.dart';
import '../tap to run/one_tap_control.dart';

class SunsetSunrise extends StatefulWidget {
  const SunsetSunrise({super.key});

  @override
  State<SunsetSunrise> createState() => _SunsetSunriseState();
}

class _SunsetSunriseState extends State<SunsetSunrise> {
  final _scrollControllerSunrise = FixedExtentScrollController(initialItem: 16);
  final _scrollControllerSunset = FixedExtentScrollController(initialItem: 16);
  static const double _itemHeight = 60;
  String sunriseName = '';
  String sunsetName = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void setData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("sunriseName", sunriseName);
      prefs.setString("sunsetName", sunsetName);
    });
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      sunriseName = prefs.getString("sunriseName")!;
      sunsetName = prefs.getString("sunsetName")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sunsetsunriseProvider = Provider.of<SunsetSunriseProvider>(context);
    var provider = Provider.of<AddSituationProvider>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    sunsetName = sunsetsunriseProvider.sunsetName;
    sunriseName = sunsetsunriseProvider.sunriseName;
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
                  "Sunset/Sunrise",
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
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 30,
                              ),
                              Text(
                                "Pick Your Time",
                                style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: height / 20,
                              ),
                              Expanded(
                                child: ListWheelScrollView(
                                    controller: _scrollControllerSunrise,
                                    itemExtent: _itemHeight,
                                    physics: FixedExtentScrollPhysics(),
                                    overAndUnderCenterOpacity: 0.5,
                                    perspective: 0.004,
                                    magnification: 1.3,
                                    onSelectedItemChanged: (index) {
                                      sunsetsunriseProvider.sunriseName =
                                          sunsetsunriseProvider.sunriseList.elementAt(index);
                                    },
                                    children: [
                                      ...sunsetsunriseProvider.sunriseList.map((e) {
                                        return Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                              child: Text(
                                            e,
                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                          )),
                                        );
                                      }),
                                    ]),
                              ),
                              SizedBox(height: height / 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width / 2.5,
                                      height: height / 16,
                                      child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                              side: BorderSide(
                                                color: Colors.white.withOpacity(0.8),
                                              )),
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.nunito(
                                                color: Colors.white, fontSize: 16),
                                          )),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: width / 2.5,
                                      height: height / 16,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              sunsetsunriseProvider.isSunrise = true;
                                              if (sunsetsunriseProvider.isSunrise == true) {
                                                sunsetsunriseProvider.isSunset = false;
                                                sunsetsunriseProvider.sunsetName = '';
                                              }
                                              if (_scrollControllerSunrise.selectedItem == 16) {
                                                sunsetsunriseProvider.sunriseName =
                                                    sunsetsunriseProvider.sunriseList.elementAt(16);
                                              }
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: Text(
                                            "Save",
                                            style: GoogleFonts.nunito(
                                                color: Colors.black, fontSize: 16),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
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
                          "Sunrise",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Text(
                          sunsetsunriseProvider.sunriseName,
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: sunsetsunriseProvider.isSunrise == true
                                  ? Colors.white
                                  : Colors.black,
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
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        sunsetsunriseProvider.sunriseName = "Sunset";
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 30,
                              ),
                              Text(
                                "Pick Your Time",
                                style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: height / 20,
                              ),
                              Expanded(
                                child: ListWheelScrollView(
                                    controller: _scrollControllerSunset,
                                    itemExtent: _itemHeight,
                                    useMagnifier: true,
                                    physics: FixedExtentScrollPhysics(),
                                    overAndUnderCenterOpacity: 0.5,
                                    perspective: 0.004,
                                    magnification: 1.3,
                                    onSelectedItemChanged: (index) {
                                      sunsetsunriseProvider.sunsetName =
                                          sunsetsunriseProvider.sunsetList.elementAt(index);
                                    },
                                    children: [
                                      ...sunsetsunriseProvider.sunsetList.map((e) {
                                        return Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                              child: Text(
                                            e,
                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                          )),
                                        );
                                      }),
                                    ]),
                              ),
                              SizedBox(height: height / 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width / 2.5,
                                      height: height / 16,
                                      child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                              side: BorderSide(
                                                color: Colors.white.withOpacity(0.8),
                                              )),
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.nunito(
                                                color: Colors.white, fontSize: 16),
                                          )),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: width / 2.5,
                                      height: height / 16,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              sunsetsunriseProvider.isSunset = true;
                                              if (sunsetsunriseProvider.isSunset == true) {
                                                sunsetsunriseProvider.isSunrise = false;
                                                sunsetsunriseProvider.sunriseName = '';
                                              }
                                              if (_scrollControllerSunset.selectedItem == 16) {
                                                sunsetsunriseProvider.sunsetName =
                                                    sunsetsunriseProvider.sunsetList.elementAt(16);
                                              }
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: Text(
                                            "Save",
                                            style: GoogleFonts.nunito(
                                                color: Colors.black, fontSize: 16),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
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
                          "Sunset",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Text(
                          sunsetsunriseProvider.sunsetName.toString(),
                          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.check,
                              color: sunsetsunriseProvider.isSunset == true
                                  ? Colors.white
                                  : Colors.black,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 8,
                ),
                Container(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {
                        if (sunsetsunriseProvider.isSunrise == false &&
                            sunsetsunriseProvider.isSunset == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("select one atleast option")));
                        } else {
                          setState(() {
                            if (provider.sunsetsunrise == true) {
                              provider.sunsetsunrise = false;
                              // provider.index.add('sunsetsunrise');
                              provider.listOfWidget.add(SunsetSunriseWidget());
                              // provider.checkSunsetSunrise();
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
}
