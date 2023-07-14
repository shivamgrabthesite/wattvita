import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_response_provider.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:flutter_wattvita/screens/Devices/all_devices.dart';
import 'package:flutter_wattvita/screens/Scene/schedule/schedule.dart';
import 'package:flutter_wattvita/screens/automation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/add_scene.dart';
import '../../../widgets/tap_appbar.dart';
import '../../../widgets/tap_to_run.dart';
import '../weather change/weather_change.dart';

class OneTapControl extends StatefulWidget {
  const OneTapControl({super.key});

  @override
  State<OneTapControl> createState() => _OneTapControlState();
}

class _OneTapControlState extends State<OneTapControl> {
  bool isEnable = true;
  bool isHeart = true;
  FocusNode inputNode = FocusNode();
  var sceneName = TextEditingController();
  int index = 0;
  int situationIndex = 0;
  String status = '';
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
    getName();
    tableStatus();
    setControlName();
  }

  void setName(String name1) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("NAME", name1);
  }

  void getName() async {
    var prefs = await SharedPreferences.getInstance();
    sceneName.text = prefs.getString("NAME")!;
  }

  void tableStatus() async {
    var prefs = await SharedPreferences.getInstance();
    status = prefs.getBool("OnOff")!.toString();
  }

  void setControlName() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      greater = prefs.getBool("greater");
      equal = prefs.getBool("equal");
      less = prefs.getBool("less");
      tempValue = prefs.getDouble("_value");
      if (greater == true) {
        sceneName.text = 'When Temperature';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);
    var responseProvider = Provider.of<AddResponseProvider>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    List<Widget> addNew = List.generate(index, (index) => AddScene());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: TapAppbar()),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
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
                        SvgPicture.asset("assets/images/coffee.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Morning Routine",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.forward,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        SvgPicture.asset("assets/images/movie.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Movie Night",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.forward,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: addNew,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // expands: true,
                        // minLines: 1,
                        // maxLines: 3,
                        controller: sceneName,
                        autofocus: isEnable,
                        focusNode: inputNode,
                        readOnly: isEnable,
                        cursorColor: Colors.black,
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
                        decoration: InputDecoration(
                          suffix: SvgPicture.asset(
                            "assets/images/edit2.svg",
                            alignment: Alignment.center,
                            height: 22,
                            width: 22,
                          ),
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "New Control",
                          hintStyle: GoogleFonts.inter(
                              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            isEnable = false;
                          });
                        },
                        onFieldSubmitted: (value) {
                          setName(value);
                          getName();
                        },
                        onTapOutside: (event) {
                          setState(() {
                            isEnable = true;
                          });
                        },
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (responseProvider.tableLamp == false ||
                                situationProvider.Device == false ||
                                situationProvider.LocationChange == false ||
                                situationProvider.Schedule == false ||
                                situationProvider.TaptoRun == false ||
                                situationProvider.humidity == false ||
                                situationProvider.sunsetsunrise == false ||
                                situationProvider.temperature == false ||
                                situationProvider.weather == false ||
                                situationProvider.windcontrol == false) {
                              if (isHeart == true) {
                                isHeart = false;
                                index = index + 1;
                              } else {
                                isHeart = true;
                                index = index - 1;
                              }
                            }
                          });
                        },
                        child: isHeart == true
                            ? SvgPicture.asset("assets/images/heart.svg")
                            : SvgPicture.asset("assets/images/yellowheart.svg")),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "When",
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            if (situationProvider.TaptoRun == false) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    backgroundColor: Colors.white,
                                    elevation: 4,
                                    child: Container(
                                      height: 200,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.exclamationmark_circle,
                                            color: Colors.black,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              addSituation(context, height);
                            }
                          },
                          child: SvgPicture.asset("assets/images/add.svg")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          situationProvider.index = index;
                          if (situationProvider.listOfWidget.length > 1) {
                            return situationProvider.listOfWidget
                                .elementAt(situationProvider.index);
                          }
                          return InkWell(
                              onTap: () {
                                addSituation(context, height);
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Add Situation",
                                    style: GoogleFonts.inter(fontSize: 14),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return index > 0
                              ? SizedBox(
                                  height: 20,
                                )
                              : Container();
                        },
                        itemCount: situationProvider.listOfWidget.length);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Do",
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            addResponse(context, height);
                          },
                          child: SvgPicture.asset("assets/images/add.svg")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    if (responseProvider.tableLamp == false) {
                      return InkWell(
                        onTap: () {
                          addResponse(context, height);
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
                              SvgPicture.asset("assets/images/devices/tablelamp.svg"),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Table Lamp",
                                    style: GoogleFonts.inter(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status: ",
                                        style: GoogleFonts.inter(fontSize: 12),
                                      ),
                                      Text(
                                        status.contains("true") ? "On" : "Off",
                                        style: GoogleFonts.inter(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      responseProvider.tableLamp = true;
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
                    return InkWell(
                      onTap: () {
                        addResponse(context, height);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Add  Response",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                Container(
                  width: 150,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () async {
                        // var prefs = await SharedPreferences.getInstance();
                        // setState(() {
                        //   prefs.remove("NAME");
                        //   sceneName.text = '';
                        // });
                        // situationProvider.closeAll();
                        // responseProvider.closeAll();
                        if (situationProvider.Device == true &&
                            situationProvider.LocationChange == true &&
                            situationProvider.Schedule == true &&
                            situationProvider.TaptoRun == true &&
                            situationProvider.humidity == true &&
                            situationProvider.sunsetsunrise == true &&
                            situationProvider.temperature == true &&
                            situationProvider.weather == true &&
                            situationProvider.windcontrol == true) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.white,
                                elevation: 4,
                                child: Container(
                                  height: 200,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.exclamationmark_circle,
                                        color: Colors.black,
                                        size: 50,
                                      ),
                                      Text("situation")
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (responseProvider.tableLamp == true) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.white,
                                elevation: 4,
                                child: Container(
                                  height: 200,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.exclamationmark_circle,
                                        color: Colors.black,
                                        size: 50,
                                      ),
                                      Text("response")
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AutomationScreen(),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Save",
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addResponse(BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            height: height / 2,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Add Response",
                  style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    height: 50,
                    // padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/directnotification.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Select smart scenes",
                          style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return AllDevices();
                        },
                      ));
                    });
                  },
                  child: Container(
                    height: 50,
                    // padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/grp1.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Run the devices",
                          style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    // padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/smsnotification.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Send notification",
                          style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    // padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/timer11.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Delay the action",
                          style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addSituation(BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) {
        var situationProvider = Provider.of<AddSituationProvider>(context);
        return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: height / 1.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Add Situation",
                    style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          situationProvider.TaptoRun = false;
                          // situationProvider.index.add('TaptoRun');
                          situationProvider.listOfWidget.add(TapToRun());
                          situationProvider.condition();
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/grp2.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Tap-To-Run",
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return WeatherChange();
                        },
                      ));
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/grp1.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Weather Change",
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/location1.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Location Change",
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Schedule();
                            },
                          ));
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/timer11.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Schedule",
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/civic1.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Device Status Change",
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward, size: 30, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
