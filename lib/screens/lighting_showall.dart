import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class LightingShowall extends StatefulWidget {
  const LightingShowall({super.key});

  @override
  State<LightingShowall> createState() => _LightingShowallState();
}

class _LightingShowallState extends State<LightingShowall> {
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
                "Lighting",
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
                      imgPath: "assets/images/devices/StripLight.svg",
                      name: "Strip Light",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/LightSource.svg",
                      name: "Light Source",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/CellingLight.svg",
                      name: "Celling Light",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/stringlight1.svg",
                      name: "String Light",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/CellingFan.svg",
                      name: "Celling Fan",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/FilamentLamp.svg",
                      name: "Filament Lamp",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/PanelLight.svg",
                      name: "Panel Light",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/TableLamp1.svg",
                      name: "Table Lamp",
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
