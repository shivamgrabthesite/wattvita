import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/device_pair.dart';
import '../../wifi_screen.dart';

class TemperatureandHumiditySensor extends StatefulWidget {
  const TemperatureandHumiditySensor({super.key});

  @override
  State<TemperatureandHumiditySensor> createState() => _TemperatureandHumiditySensorState();
}

class _TemperatureandHumiditySensorState extends State<TemperatureandHumiditySensor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Temperature and Humidity Sensor",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              DevicePair(
                img: "assets/images/devices/TemperatureandHumiditySensor.svg",
                devicename: "Temperature and Humidity Sensor".substring(0, 18) + "...",
                subtitle: "(Wi-Fi)",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WifiScreen(),
                  ));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DevicePair(
                img: "assets/images/devices/TemperatureandHumiditySensor.svg",
                devicename: "Temperature and Humidity Sensor".substring(0, 18) + "...",
                subtitle: "(BLE + Wi-Fi)",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WifiScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
