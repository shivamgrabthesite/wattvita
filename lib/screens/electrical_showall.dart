import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';
import '../widgets/notification_badge.dart';
import 'Devices/Electrical/Adapter.dart';
import 'Devices/Electrical/ConditionerMate.dart';
import 'Devices/Electrical/CurtainSwitch.dart';
import 'Devices/Electrical/DimmerSwitch.dart';
import 'Devices/Electrical/FanSwitch.dart';
import 'Devices/Electrical/GarageDoorOpener.dart';
import 'Devices/Electrical/PowerStrip.dart';
import 'Devices/Electrical/Socket.dart';
import 'Devices/Electrical/SwitchModule.dart';
import 'Devices/Electrical/Switches.dart';
import 'Devices/Electrical/WaterPump.dart';
import 'Devices/Electrical/WirelessSwitch.dart';

class ElectricalShowAll extends StatefulWidget {
  const ElectricalShowAll({super.key});

  @override
  State<ElectricalShowAll> createState() => _ElectricalShowAllState();
}

class _ElectricalShowAllState extends State<ElectricalShowAll> {
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
              Text(
                "Electrical",
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
                      imgPath: "assets/images/devices/Socket.svg",
                      name: "Socket",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Socket(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Switch.svg",
                      name: "Switch",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Switches(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/Adapter.svg",
                      name: "Adapter",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Adapter(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/PowerStrip.svg",
                      name: "Power Strip",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PowerStrip(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/cm.svg",
                      name: "Conditioner Mate",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ConditionerMate(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/WirelessSwitch.svg",
                      name: "Wireless Switch",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WirelessSwitch(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/CurtainSwitch.svg",
                      name: "Curtain Switch",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CurtainSwitch(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/GarageDoorOpener.svg",
                      name: "Garage Door Opener",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GarageDoorOpener(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/FanSwitch.svg",
                      name: "Fan Switch",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FanSwitch(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/WaterPump.svg",
                      name: "Water Pump",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WaterPump(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/SwitchModule.svg",
                      name: "Switch Module",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SwitchModule(),
                        ));
                      },
                    ),
                    Devices(
                      imgPath: "assets/images/devices/DimmerSwitch.svg",
                      name: "Dimmer Switch",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DimmerSwitch(),
                        ));
                      },
                    )
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
