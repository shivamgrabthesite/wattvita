import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class SensorShowall extends StatefulWidget {
  const SensorShowall({super.key});

  @override
  State<SensorShowall> createState() => _SensorShowallState();
}

class _SensorShowallState extends State<SensorShowall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sensor",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 120),
                  children: [
                    Devices(
                      imgPath: "assets/images/devices/TemperatureandHumiditySensor.svg",
                      name: "Temperature and Humidity Sensor",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Sensor.svg",
                      name: "Sensor",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/MotionDetector.svg",
                      name: "Motion Detector",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/FloodDetector.svg",
                      name: "Flood   Detector",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmokeDetector.svg",
                      name: "Smoke Detector",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/GasDetector.svg",
                      name: "Gas Detector",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/EmergencyButton.svg",
                      name: "Emergency Button",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/LineSensors.svg",
                      name: "Line Sensors",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/PathSensors.svg",
                      name: "Path Sensors",
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
