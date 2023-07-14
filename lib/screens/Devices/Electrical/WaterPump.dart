import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/device_pair.dart';
import '../../wifi_screen.dart';

class WaterPump extends StatefulWidget {
  const WaterPump({super.key});

  @override
  State<WaterPump> createState() => _WaterPumpState();
}

class _WaterPumpState extends State<WaterPump> {
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
                "Water Pump",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              DevicePair(
                img: "assets/images/devices/WaterPump.svg",
                devicename: "Water Pump",
                subtitle: "(4G)",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WifiScreen(),
                  ));
                },
              ),
              SizedBox(
                height: 16,
              ),
              DevicePair(
                img: "assets/images/devices/WaterPump.svg",
                devicename: "Water Pump",
                subtitle: "(BLE - Wi-Fi)",
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
