import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class CameraLockShowall extends StatefulWidget {
  const CameraLockShowall({super.key});

  @override
  State<CameraLockShowall> createState() => _CameraLockShowallState();
}

class _CameraLockShowallState extends State<CameraLockShowall> {
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
                "Camera and Lock",
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
                      mainAxisExtent: 110),
                  children: [
                    Devices(
                      imgPath: "assets/images/devices/SmartCamera.svg",
                      name: "Smart Camera",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartLock.svg",
                      name: "Smart Lock",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartDoorbell.svg",
                      name: "Smart Doorbell",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartLock.svg",
                      name: "Mini Lock",
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
