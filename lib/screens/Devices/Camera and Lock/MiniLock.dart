import 'package:flutter/material.dart';
import 'package:flutter_wattvita/screens/wifi_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/device_pair.dart';

class MiniLock extends StatefulWidget {
  const MiniLock({super.key});

  @override
  State<MiniLock> createState() => _MiniLockState();
}

class _MiniLockState extends State<MiniLock> {
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
                "Mini Lock",
                style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              DevicePair(
                img: "assets/images/devices/SmartLock.svg",
                devicename: "Mini Lock",
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
                img: "assets/images/devices/SmartLock.svg",
                devicename: "Mini Lock",
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
