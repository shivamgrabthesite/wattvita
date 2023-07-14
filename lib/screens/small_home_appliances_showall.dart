import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class SmallHomeAppliancesShowall extends StatefulWidget {
  const SmallHomeAppliancesShowall({super.key});

  @override
  State<SmallHomeAppliancesShowall> createState() => _SmallHomeAppliancesShowallState();
}

class _SmallHomeAppliancesShowallState extends State<SmallHomeAppliancesShowall> {
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
                "Small Home Appliances",
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
                      imgPath: "assets/images/devices/Fan.svg",
                      name: "Fan",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/AirCooler.svg",
                      name: "Air Cooler",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartToilet.svg",
                      name: "Smart Toilet",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Curtain.svg",
                      name: "Curtain",
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
