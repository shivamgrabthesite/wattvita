import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/device_pair.dart';
import '../../wifi_screen.dart';

class SmartDoorbell extends StatefulWidget {
  const SmartDoorbell({super.key});

  @override
  State<SmartDoorbell> createState() => _SmartDoorbellState();
}

class _SmartDoorbellState extends State<SmartDoorbell> {
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
                "Smart Doorbell",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              DevicePair(
                img: "assets/images/devices/SmartDoorbell.svg",
                devicename: "Smart Doorbell",
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
                img: "assets/images/devices/SmartDoorbell.svg",
                devicename: "Smart Doorbell",
                subtitle: "(BLE)",
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
