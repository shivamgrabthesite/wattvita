import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/appbar.dart';
import 'package:fl_chart/fl_chart.dart';

class EnergySavingScreen extends StatefulWidget {
  const EnergySavingScreen({super.key});

  @override
  State<EnergySavingScreen> createState() => _EnergySavingScreenState();
}

class _EnergySavingScreenState extends State<EnergySavingScreen> {
  @override
  Widget build(BuildContext context) {
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
                  "Energy Saving",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 208,
                  decoration:
                      BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 10),
                          child: Text(
                            'Energy Consumption',
                            style: GoogleFonts.redHatDisplay(
                                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                      Container(
                        height: 160,
                        child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            backgroundColor: Colors.black,
                            primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(color: Colors.white),
                              axisLine: AxisLine(color: Colors.black),
                              majorTickLines: MajorTickLines(width: 0),
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                                labelStyle: TextStyle(color: Colors.white),
                                axisLine: AxisLine(color: Colors.black),
                                majorTickLines: MajorTickLines(width: 0),
                                interval: 20,
                                maximum: 60,
                                minimum: 0),
                            series: <ChartSeries>[
                              SplineSeries<ChartData, String>(
                                  color: Colors.yellow,
                                  dataSource: [
                                    ChartData('0', 0),
                                    ChartData('10', 55),
                                    ChartData('40', 10),
                                    ChartData('50', 43),
                                  ],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "361.4 kwh",
                                  style:
                                      GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Average Usage",
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(Iconsax.calendar_1),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "17 Apr 2023",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                      Container(
                        height: 220,
                        padding: EdgeInsets.all(10),
                        child: BarChart(
                          BarChartData(
                            maxY: 10,
                            gridData:
                                FlGridData(drawHorizontalLine: false, drawVerticalLine: false),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                    toY: 2,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: 6,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: 6,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    toY: 5,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                    toY: 3,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(
                                    toY: 7,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ]),
                              BarChartGroupData(x: 6, barRods: [
                                BarChartRodData(
                                    toY: 3,
                                    color: Colors.black,
                                    width: 16,
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: 10, color: Color.fromRGBO(0, 0, 0, 0.3)))
                              ])
                            ],
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 34,
                                  getTitlesWidget: (value, meta) {
                                    String text;
                                    switch (value.toInt()) {
                                      case 0:
                                        text = 'MON';
                                        break;
                                      case 1:
                                        text = 'TUE';
                                        break;
                                      case 2:
                                        text = 'WED';
                                        break;
                                      case 3:
                                        text = 'THU';
                                        break;
                                      case 4:
                                        text = 'FRI';
                                        break;
                                      case 5:
                                        text = 'SAT';
                                        break;
                                      case 6:
                                        text = 'SUN';
                                        break;
                                      default:
                                        text = '';
                                        break;
                                    }
                                    return SideTitleWidget(
                                        child: Column(
                                          children: [
                                            Text(
                                              text,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              value.toInt().toString(),
                                              style: TextStyle(fontSize: 10, color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        axisSide: meta.axisSide);
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Usage Details",
                    style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 110),
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/images/devices/ac.svg'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Air Conditioning",
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "13.56kwh",
                              style: GoogleFonts.inter(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
