import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class EnergyShowll extends StatefulWidget {
  const EnergyShowll({super.key});

  @override
  State<EnergyShowll> createState() => _EnergyShowllState();
}

class _EnergyShowllState extends State<EnergyShowll> {
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
                "Energy",
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
                      imgPath: "assets/images/devices/SmartMeter.svg",
                      name: "Smart Meter",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartWaterMeter.svg",
                      name: "Smart Water Meter",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/EVCharger.svg",
                      name: "EV Charger",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Inverter.svg",
                      name: "Inverter",
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
