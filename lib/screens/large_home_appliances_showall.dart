import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class LargeHomeAppliancesShowall extends StatefulWidget {
  const LargeHomeAppliancesShowall({super.key});

  @override
  State<LargeHomeAppliancesShowall> createState() => _LargeHomeAppliancesShowallState();
}

class _LargeHomeAppliancesShowallState extends State<LargeHomeAppliancesShowall> {
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
                "Large Home Appliances",
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
                      imgPath: "assets/images/devices/WashingMachine1.svg",
                      name: "Air Conditioning",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/WaterHeater1.svg",
                      name: "Refrigerator",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Refrigerator1.svg",
                      name: "Water Heater",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/AirConditioning1.svg",
                      name: "Washing Machine",
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
