import 'package:flutter/material.dart';
import 'package:flutter_wattvita/screens/camera_lock_showall.dart';
import 'package:flutter_wattvita/screens/energy_showall.dart';
import 'package:flutter_wattvita/screens/gateway_control_showall.dart';
import 'package:flutter_wattvita/screens/small_home_appliances_showall.dart';
import 'package:flutter_wattvita/screens/electrical_showall.dart';
import 'package:flutter_wattvita/screens/large_home_appliances_showall.dart';
import 'package:flutter_wattvita/screens/lighting_showall.dart';
import 'package:flutter_wattvita/screens/sensor_showall.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/devices.dart';
import 'Devices/Camera and Lock/SmartCamera.dart';
import 'Devices/Camera and Lock/SmartDoorbell.dart';
import 'Devices/Camera and Lock/SmartLock.dart';
import 'Devices/Electrical/Adapter.dart';
import 'Devices/Electrical/ConditionerMate.dart';
import 'Devices/Electrical/PowerStrip.dart';
import 'Devices/Electrical/Socket.dart';
import 'Devices/Electrical/Switches.dart';
import 'Devices/Electrical/WirelessSwitch.dart';
import 'Devices/Energy/EVCharger.dart';
import 'Devices/Energy/Inverter.dart';
import 'Devices/Energy/SmartMeter.dart';
import 'Devices/Energy/SmartWaterMeter.dart';
import 'Devices/Gateway Control/Gateway.dart';
import 'Devices/Gateway Control/Router.dart';
import 'Devices/Kitchen Appliances/CoffeeMaker.dart';
import 'Devices/Kitchen Appliances/Cooker.dart';
import 'Devices/Kitchen Appliances/Oven.dart';
import 'Devices/Kitchen Appliances/SmartKettle.dart';
import 'Devices/Kitchen Appliances/TeaMaker.dart';
import 'Devices/Large Home Appliances/AirConditioning.dart';
import 'Devices/Large Home Appliances/Refrigerator.dart';
import 'Devices/Large Home Appliances/RooftopSolar.dart';
import 'Devices/Large Home Appliances/WashingMachine.dart';
import 'Devices/Large Home Appliances/WaterHeater.dart';
import 'Devices/Lighting/CellingFan.dart';
import 'Devices/Lighting/CellingLight.dart';
import 'Devices/Lighting/FilamentLamp.dart';
import 'Devices/Lighting/LightSource.dart';
import 'Devices/Lighting/PanelLight.dart';
import 'Devices/Lighting/StringLight.dart';
import 'Devices/Lighting/StripLight.dart';
import 'Devices/Lighting/TableLamp.dart';
import 'Devices/Sensor/EmergencyButton.dart';
import 'Devices/Sensor/FloodDetector.dart';
import 'Devices/Sensor/GasDetector.dart';
import 'Devices/Sensor/LineSensors.dart';
import 'Devices/Sensor/MotionDetector.dart';
import 'Devices/Sensor/PathSensors.dart';
import 'Devices/Sensor/Sensor.dart';
import 'Devices/Sensor/SmokeDetector.dart';
import 'Devices/Sensor/TemperatureandHumiditySensor.dart';
import 'Devices/Small Home Appliances/AirCooler.dart';
import 'Devices/Small Home Appliances/Curtain.dart';
import 'Devices/Small Home Appliances/Fan.dart';
import 'Devices/Small Home Appliances/SmartToilet.dart';
import 'kitchen_appliances_showall.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Electrical",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ElectricalShowAll(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
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
                      const SizedBox(
                        width: 10,
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
                      const SizedBox(
                        width: 10,
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
                      const SizedBox(
                        width: 10,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/ConditionerMate.svg",
                        name: "Conditioner Mate",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConditionerMate(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/WirelessSwitch.svg",
                        name: "Wireless Switch",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WirelessSwitch(),
                          ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Lighting",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LightingShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/StripLight.svg",
                        name: "Strip Light",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StripLight(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/LightSource.svg",
                        name: "Light Source",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LightSource(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/CellingLight.svg",
                        name: "Celling Light",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CellingLight(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/CellingFan.svg",
                        name: "Celling Fan",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CellingFan(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/StringLight.svg",
                        name: "String Light",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StringLight(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/FilamentLamp.svg",
                        name: "Filament Lamp",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FilamentLamp(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/PanelLight.svg",
                        name: "Panel Light",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PanelLight(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/TableLamp1.svg",
                        name: "Table Lamp",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TableLamp(),
                          ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Sensor",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SensorShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/TemperatureandHumiditySensor.svg",
                        name: "Temperature and Humidity Sensor",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TemperatureandHumiditySensor(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Sensor.svg",
                        name: "Sensor",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Sensor(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/MotionDetector.svg",
                        name: "Motion Detector",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MotionDetector(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/FloodDetector.svg",
                        name: "Flood Detector",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FloodDetector(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmokeDetector.svg",
                        name: "Smoke Detector",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmokeDetector(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/GasDetector.svg",
                        name: "Gas Detector",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GasDetector(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/EmergencyButton.svg",
                        name: "Emergency Button",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmergencyButton(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/LineSensors.svg",
                        name: "Line Sensors",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LineSensors(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/PathSensors.svg",
                        name: "Path Sensors",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PathSensors(),
                          ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Large Home Appliance",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LargeHomeAppliancesShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/WashingMachine1.svg",
                        name: "Air Conditioning",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AirConditioning(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/WaterHeater1.svg",
                        name: "Refrigerator",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Refrigerator(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Refrigerator1.svg",
                        name: "Water Heater",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WaterHeater(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/AirConditioning1.svg",
                        name: "Washing Machine",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WashingMachine(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/RooftopSolar.svg",
                        name: "Rooftop Solar",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RooftopSolar(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Small Home Appliance",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SmallHomeAppliancesShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/Fan.svg",
                        name: "Fan",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Fan(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/AirCooler.svg",
                        name: "Air Cooler",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AirCooler(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartToilet.svg",
                        name: "Smart Toilet",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartToilet(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Curtain.svg",
                        name: "Curtain",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Curtain(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Kitchen Appliances",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => KitchenAppliancesShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/Oven.svg",
                        name: "Oven",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Oven(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Cooker.svg",
                        name: "Cooker",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cooker(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/CoffeeMaker.svg",
                        name: "Coffee Maker",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CoffeeMaker(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/TeaMaker.svg",
                        name: "Tea Maker",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TeaMaker(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartKettle.svg",
                        name: "Smart Kettle",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartKettle(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Camera and Lock",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraLockShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/SmartCamera.svg",
                        name: "Smart  Camera",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartCamera(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartLock.svg",
                        name: "Smart Lock",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartLock(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartDoorbell.svg",
                        name: "Smart Doorbell",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartDoorbell(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartLock.svg",
                        name: "Mini Lock",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartLock(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Gateway Control",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GatewayControlShowall(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/Gateway.svg",
                        name: "Router",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Routers(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Router.svg",
                        name: "Gateway",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Gateway(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Energy",
                      style: GoogleFonts.redHatDisplay(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EnergyShowll(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Devices(
                        imgPath: "assets/images/devices/SmartMeter.svg",
                        name: "Smart Meter",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartMeter(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/SmartWaterMeter.svg",
                        name: "Smart Water Meter",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmartWaterMeter(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/EVCharger.svg",
                        name: "EV Charger",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EVCharger(),
                          ));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Devices(
                        imgPath: "assets/images/devices/Inverter.svg",
                        name: "Inverter",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Inverter(),
                          ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
