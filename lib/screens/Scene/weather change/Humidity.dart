import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/humidity_widget.dart';
import '../tap to run/one_tap_control.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  bool dry = false;
  bool comfortable = false;
  bool moist = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void setData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("dry", dry);
    prefs.setBool("comfortable", comfortable);
    prefs.setBool("moist", moist);
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      dry = prefs.getBool("dry")!;
      comfortable = prefs.getBool("comfortable")!;
      moist = prefs.getBool("moist")!;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Humidity",
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
                      dry = !dry;
                      if (dry == true) {
                        comfortable = false;
                        moist = false;
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
                          "Dry",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        Text(
                          " (0% - 40%)",
                          style:
                              GoogleFonts.inter(fontSize: 16, color: Colors.black.withOpacity(0.5)),
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
                              color: dry == true ? Colors.white : Colors.black,
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
                      comfortable = !comfortable;
                      if (comfortable == true) {
                        dry = false;
                        moist = false;
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
                          "Comfortable",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        Text(
                          " (40% - 70%)",
                          style:
                              GoogleFonts.inter(fontSize: 16, color: Colors.black.withOpacity(0.5)),
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
                              color: comfortable == true ? Colors.white : Colors.black,
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
                      moist = !moist;
                      if (moist == true) {
                        comfortable = false;
                        dry = false;
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
                          "Moist",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        Text(
                          " (70% - 100%)",
                          style:
                              GoogleFonts.inter(fontSize: 16, color: Colors.black.withOpacity(0.5)),
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
                              color: moist == true ? Colors.white : Colors.black,
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
                        if (dry == false && comfortable == false && moist == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("select one atleast option")));
                        } else {
                          setState(() {
                            if (provider.humidity == true) {
                              provider.humidity = false;
                              // provider.index.add('humidity');
                              provider.listOfWidget.add(HumidityWidget());
                              // provider.checkHumidity();
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
