import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/device_pair.dart';
import '../../wifi_screen.dart';

class CurtainSwitch extends StatefulWidget {
  const CurtainSwitch({super.key});

  @override
  State<CurtainSwitch> createState() => _CurtainSwitchState();
}

class _CurtainSwitchState extends State<CurtainSwitch> {
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
                "Curtain Switch",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              DevicePair(
                img: "assets/images/devices/CurtainSwitch.svg",
                devicename: "Curtain Switch",
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
                img: "assets/images/devices/CurtainSwitch.svg",
                devicename: "Curtain Switch",
                subtitle: "(BLU - Wi-Fi)",
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
