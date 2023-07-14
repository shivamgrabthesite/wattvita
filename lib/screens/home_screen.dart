// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_wattvita/screens/add_device.dart';

import '../services/profile_data.dart';
import '../widgets/notification_badge.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  // String userName;
  HomeScreen({
    Key? key,
    // required this.userName,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  String? formate;
  String? token;
  String? userName;
  dateFormate() {
    var date = DateTime.now();
    formate = DateFormat('dd MMM yyyy').format(date);
  }

  @override
  void initState() {
    super.initState();
    dateFormate();
    getData();
  }

  getData() async {
    var pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    print("token_____get--------------" + token!);

    ProfileData.getdata(token!).then((value) {
      print("profile------------" + value!.toJson().toString());
      setState(() {
        userName = value.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, " + userName!,
                          style: GoogleFonts.redHatDisplay(fontSize: 32),
                        ),
                        Text(
                          "Welcome to your smart home.",
                          style:
                              GoogleFonts.inter(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.5)),
                        )
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ));
                      },
                      child: NotificationBadge(
                        onTap: () {},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                  height: 160,
                  width: width / 1,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(
                              calendarType: CalendarDatePicker2Type.single,
                            ),
                            dialogSize: Size(width / 1.2, height / 1.8),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Text(
                                "Energy Usage",
                                style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                              ),
                              const Spacer(),
                              SvgPicture.asset("assets/images/calendar2.svg"),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                formate.toString(),
                                style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                        height: 0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/Vector7.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                "24.6 kWh",
                                style: GoogleFonts.redHatDisplay(
                                    fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Today",
                                style: GoogleFonts.inter(
                                    fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "325.6 kWh",
                                style: GoogleFonts.redHatDisplay(
                                    fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "This Month",
                                style: GoogleFonts.inter(
                                    fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset("assets/images/Vector8.svg"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddDeviceScreen(),
                    ));
                  },
                  child: Container(
                    height: 60,
                    width: width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Add appliances. Save energy.",
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                        const Icon(
                          Icons.add,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Text(
                  "Rooms",
                  style: GoogleFonts.redHatDisplay(fontSize: 26),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Container(
                  height: 200,
                  child: ListView(
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SvgPicture.asset(
                              "assets/images/Livingroom.svg",
                            ),
                            const Spacer(),
                            Text(
                              "LIVING ROOM",
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            SvgPicture.asset(
                              "assets/images/Bedroom.svg",
                            ),
                            const Spacer(),
                            Text(
                              "BED ROOM",
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SvgPicture.asset(
                              "assets/images/Kitchen.svg",
                            ),
                            const Spacer(),
                            Text(
                              "KITCHEN",
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset(
                              "assets/images/Discussionroom.svg",
                            ),
                            const Spacer(),
                            Text(
                              "Discussion room".toUpperCase(),
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset(
                              "assets/images/meetingroom.svg",
                            ),
                            const Spacer(),
                            Text(
                              "meeting room".toUpperCase(),
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset(
                              "assets/images/Breakroom.svg",
                            ),
                            const Spacer(),
                            Text(
                              "Break room".toUpperCase(),
                              style: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ScrollIndicator(
                  scrollController: scrollController,
                  width: 50,
                  height: 5,
                  indicatorWidth: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
                  indicatorDecoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 208, 63, 1),
                      borderRadius: BorderRadius.circular(10)),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
