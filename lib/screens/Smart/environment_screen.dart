import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/appbar.dart';

class EnvironmentScreen extends StatefulWidget {
  EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  ScrollController scrollController = ScrollController();
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _letters;
  late ScrollController _numbers;
  late ScrollController _logo;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _letters = _controllers.addAndGet();
    _numbers = _controllers.addAndGet();
    _logo = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _letters.dispose();
    _numbers.dispose();
    _logo.dispose();
    super.dispose();
  }

  List<double> data = [0.2, 0.5, 0.7, 0.2, 0.3, 0.5, 0.7, 0.2, 0.3, 0.5, 0.7, 0.2, 0.3];
  List time = [
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm',
    '6:30 pm'
  ];
  List<String> img = [
    'assets/images/Subtract.svg',
    'assets/images/Cloud_alt_light.svg',
    'assets/images/Group 3993.svg',
    'assets/images/Sun_light.svg',
    'assets/images/Group 3993.svg',
    'assets/images/Sun_light.svg',
    'assets/images/Sun_light.svg',
    'assets/images/Group 3993.svg',
    'assets/images/Group 3993.svg',
    'assets/images/Subtract.svg',
    'assets/images/Subtract.svg',
    'assets/images/Cloud_alt_light.svg',
    'assets/images/Cloud_alt_light.svg',
  ];
  List logo = List.generate(
    13,
    (index) => 'assets/images/Group (12).svg',
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
            padding: EdgeInsets.all(14),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Environment",
                    style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/sun1.svg',
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "05:18",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Sunrise",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Spacer(),
                              Text(
                                "38 °C",
                                style: GoogleFonts.inter(
                                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "19:13",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Sunset",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SvgPicture.asset(
                                'assets/images/sunfog.svg',
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Excellent",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "PM2.5",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "35.0%",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Humidity",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "999.0hPa",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Air pressure",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.3)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Generally Clear. Low 27 °C",
                              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              controller: _letters,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(time[index]),
                                    SvgPicture.asset(img[index]),
                                    Text("data"),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 13),
                        ),
                        Expanded(
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            controller: _numbers,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                // height: 30,
                                padding: EdgeInsets.only(left: 30),
                                width: 755,
                                child: Sparkline(
                                  gridLineWidth: 10,
                                  gridLineColor: Colors.black,
                                  max: 1,
                                  min: 0,
                                  data: data,
                                  lineWidth: 1.0,
                                  lineColor: Colors.black,
                                  pointsMode: PointsMode.all,
                                  pointColor: Color.fromRGBO(255, 213, 62, 1),
                                  pointSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              controller: _logo,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        logo[index],
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 14,
                                );
                              },
                              itemCount: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Summary :",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.3)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/AQI.svg',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "AQI",
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                "Good(37)",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Pollen.svg',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Pollen",
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                "Low",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/DrivingDifficulty.svg',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Driving Difficulty",
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                "None",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Running.svg',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Running",
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                "Very poor",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
