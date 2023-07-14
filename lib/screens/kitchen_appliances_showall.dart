import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class KitchenAppliancesShowall extends StatefulWidget {
  const KitchenAppliancesShowall({super.key});

  @override
  State<KitchenAppliancesShowall> createState() => _KitchenAppliancesShowallState();
}

class _KitchenAppliancesShowallState extends State<KitchenAppliancesShowall> {
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
                "Kitchen Appliances",
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
                      imgPath: "assets/images/devices/Oven.svg",
                      name: "Oven",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Cooker.svg",
                      name: "Cooker",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/CoffeeMaker.svg",
                      name: "Coffee Maker",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/TeaMaker.svg",
                      name: "Tea Maker",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SmartKettle.svg",
                      name: "Smart Kettle",
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
