import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class EntertainmentShowall extends StatefulWidget {
  const EntertainmentShowall({super.key});

  @override
  State<EntertainmentShowall> createState() => _EntertainmentShowallState();
}

class _EntertainmentShowallState extends State<EntertainmentShowall> {
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
                "Entertainment",
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
                      imgPath: "assets/images/devices/TV.svg",
                      name: "TV",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/CloudFrame.svg",
                      name: "Cloud Frame",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/3DPrinter.svg",
                      name: "3D Printer",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/DotMatrixScreen.svg",
                      name: "Dot Matrix Screen",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/BookReader.svg",
                      name: "Book Reader",
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
