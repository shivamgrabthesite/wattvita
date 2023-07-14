import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';

class GatewayControlShowall extends StatefulWidget {
  const GatewayControlShowall({super.key});

  @override
  State<GatewayControlShowall> createState() => _GatewayControlShowallState();
}

class _GatewayControlShowallState extends State<GatewayControlShowall> {
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
                "Gateway Control",
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
                      imgPath: "assets/images/devices/Gateway.svg",
                      name: "Router",
                      onTap: () {},
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Router.svg",
                      name: "Gateway",
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
