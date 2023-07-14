import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/repeat_schedule.dart';
import 'package:flutter_wattvita/screens/Scene/tap%20to%20run/one_tap_control.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/notification_badge.dart';

class Schedule extends StatefulWidget {
  Schedule({
    Key? key,
  }) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime? initialdate;
  String? date, time;

  @override
  void initState() {
    super.initState();
    initialdate = DateTime.now();
    time = DateFormat('Hm').format(initialdate!);
    date = DateFormat('dd/MM/yy').format(initialdate!);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RepeatSchedule>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Schedule",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 50,
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.black, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Set time",
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CupertinoTheme(
                              data: CupertinoThemeData(
                                  brightness: Brightness.dark,
                                  textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle:
                                          TextStyle(fontWeight: FontWeight.w600, fontSize: 25))),
                              child: Container(
                                height: 200,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: false,
                                  initialDateTime: initialdate,
                                  backgroundColor: Colors.black,
                                  onDateTimeChanged: (value) {
                                    time = DateFormat('Hm').format(value);
                                    date = DateFormat('dd/MM/yy').format(value);
                                    initialdate = DateTime.now();
                                    print("time---------" + time!);
                                    print("date---------" + date!);
                                  },
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width / 2.5,
                                height: height / 14,
                                child: OutlinedButton(
                                    onPressed: () {
                                      setState.call(() {
                                        initialdate = null;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(0.8),
                                        )),
                                    child: Text(
                                      "Reset",
                                      style: GoogleFonts.nunito(color: Colors.white, fontSize: 16),
                                    )),
                              ),
                              Spacer(),
                              Container(
                                width: width / 2.5,
                                height: height / 14,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => OneTapControl(),
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: Text(
                                      "Next",
                                      style: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 16,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        var provider = Provider.of<RepeatSchedule>(context);
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: height / 1.4,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  Text(
                                    "Repeat",
                                    style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: provider.days.keys.map((String key) {
                                        return Theme(
                                          data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                  side: BorderSide(color: Colors.white))),
                                          child: CheckboxListTile(
                                            activeColor: Colors.white,
                                            checkColor: Colors.black,
                                            checkboxShape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5)),
                                            title: Text(key,
                                                style: GoogleFonts.inter(
                                                    fontSize: 16, color: Colors.white)),
                                            value: provider.days[key],
                                            onChanged: (value) {
                                              setState.call(() {
                                                provider.days[key] = value!;
                                              });
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ).whenComplete(() {
                      setState(() {});
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
                        SvgPicture.asset("assets/images/timer.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Repeat",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        const Spacer(),
                        Container(
                          width: 174,
                          child: Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              children: provider.days.keys.map((String key) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        provider.days[key] == true
                                            ? "${key.substring(0, 3)}. "
                                            : "",
                                        textAlign: TextAlign.end,
                                        style:
                                            GoogleFonts.inter(fontSize: 12, color: Colors.black)),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
