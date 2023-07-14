import 'package:flutter/material.dart';
import 'package:flutter_wattvita/provider/add_response_provider.dart';
import 'package:flutter_wattvita/provider/add_situation_provider.dart';
import 'package:flutter_wattvita/provider/repeat_schedule.dart';
import 'package:flutter_wattvita/provider/sunset_sunrise_provider.dart';
import 'package:flutter_wattvita/screens/Devices/Camera%20and%20Lock/MiniLock.dart';
import 'package:flutter_wattvita/screens/Devices/Camera%20and%20Lock/SmartCamera.dart';
import 'package:flutter_wattvita/screens/Devices/Camera%20and%20Lock/SmartDoorbell.dart';
import 'package:flutter_wattvita/screens/Devices/Camera%20and%20Lock/SmartLock.dart';
import 'package:flutter_wattvita/screens/Devices/Energy/EVCharger.dart';
import 'package:flutter_wattvita/screens/Devices/Energy/Inverter.dart';
import 'package:flutter_wattvita/screens/Devices/Energy/SmartMeter.dart';
import 'package:flutter_wattvita/screens/Devices/Energy/SmartWaterMeter.dart';
import 'package:flutter_wattvita/screens/Devices/Entertainment/BookReader.dart';
import 'package:flutter_wattvita/screens/Devices/Entertainment/CloudFrame.dart';
import 'package:flutter_wattvita/screens/Devices/Entertainment/TV.dart';
import 'package:flutter_wattvita/screens/Devices/Entertainment/ThreeDPrinter.dart';
import 'package:flutter_wattvita/screens/Devices/Gateway%20Control/Gateway.dart';
import 'package:flutter_wattvita/screens/Devices/Gateway%20Control/Router.dart';
import 'package:flutter_wattvita/screens/Devices/Kitchen%20Appliances/CoffeeMaker.dart';
import 'package:flutter_wattvita/screens/Devices/Kitchen%20Appliances/Cooker.dart';
import 'package:flutter_wattvita/screens/Devices/Kitchen%20Appliances/Oven.dart';
import 'package:flutter_wattvita/screens/Devices/Kitchen%20Appliances/SmartKettle.dart';
import 'package:flutter_wattvita/screens/Devices/Kitchen%20Appliances/TeaMaker.dart';
import 'package:flutter_wattvita/screens/Devices/Large%20Home%20Appliances/AirConditioning.dart';
import 'package:flutter_wattvita/screens/Devices/Large%20Home%20Appliances/Refrigerator.dart';
import 'package:flutter_wattvita/screens/Devices/Large%20Home%20Appliances/RooftopSolar.dart';
import 'package:flutter_wattvita/screens/Devices/Large%20Home%20Appliances/WashingMachine.dart';
import 'package:flutter_wattvita/screens/Devices/Large%20Home%20Appliances/WaterHeater.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/CellingFan.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/CellingLight.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/FilamentLamp.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/LightSource.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/PanelLight.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/StringLight.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/StripLight.dart';
import 'package:flutter_wattvita/screens/Devices/Lighting/TableLamp.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/EmergencyButton.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/FloodDetector.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/GasDetector.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/LineSensors.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/MotionDetector.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/PathSensors.dart';
import 'package:flutter_wattvita/screens/Devices/Sensor/SmokeDetector.dart';
import 'package:flutter_wattvita/screens/Devices/Small%20Home%20Appliances/AirCooler.dart';
import 'package:flutter_wattvita/screens/Devices/Small%20Home%20Appliances/Curtain.dart';
import 'package:flutter_wattvita/screens/Devices/Small%20Home%20Appliances/SmartToilet.dart';
import 'package:flutter_wattvita/screens/Devices/all_devices.dart';
import 'package:flutter_wattvita/screens/Scene/create%20scene/create_scene_screen.dart';
import 'package:flutter_wattvita/screens/Scene/create%20scene/scene_screen2.dart';
import 'package:flutter_wattvita/screens/Scene/schedule/delay.dart';
import 'package:flutter_wattvita/screens/Scene/schedule/schedule.dart';
import 'package:flutter_wattvita/screens/Smart/energy_saving_screen.dart';
import 'package:flutter_wattvita/screens/Smart/smart_camera_screen.dart';
import 'package:flutter_wattvita/screens/Smart/smart_screen.dart';
import 'package:flutter_wattvita/screens/automation_screen.dart';
import 'package:flutter_wattvita/screens/camera_lock_showall.dart';
import 'package:flutter_wattvita/screens/change_password.dart';
import 'package:flutter_wattvita/screens/energy_showall.dart';
import 'package:flutter_wattvita/screens/entertainment_showall.dart';
import 'package:flutter_wattvita/screens/Smart/environment_screen.dart';
import 'package:flutter_wattvita/screens/forgot_password.dart';
import 'package:flutter_wattvita/screens/gateway_control_showall.dart';
import 'package:flutter_wattvita/screens/kitchen_appliances_showall.dart';
import 'package:flutter_wattvita/screens/Scene/location%20change/location1.dart';
import 'package:flutter_wattvita/screens/Scene/location%20change/location2.dart';
import 'package:flutter_wattvita/screens/Scene/tap%20to%20run/one_tap_control.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/Humidity.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/SunsetSunrise.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/Temperature.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/weather.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/weather_change.dart';
import 'package:flutter_wattvita/screens/Scene/weather%20change/wind_control.dart';
import 'package:flutter_wattvita/screens/notification_screen.dart';
import 'package:flutter_wattvita/screens/otp_screen.dart';
import 'package:flutter_wattvita/screens/privacy_permission_settings.dart';
import 'package:flutter_wattvita/screens/privacy_policy.dart';
import 'package:flutter_wattvita/screens/profile_edit.dart';
import 'package:flutter_wattvita/screens/profile_screen2.dart';
import 'package:flutter_wattvita/screens/small_home_appliances_showall.dart';
import 'package:flutter_wattvita/screens/add_device.dart';
import 'package:flutter_wattvita/screens/electrical_showall.dart';
import 'package:flutter_wattvita/screens/home_screen.dart';
import 'package:flutter_wattvita/screens/large_home_appliances_showall.dart';
import 'package:flutter_wattvita/screens/lighting_showall.dart';
import 'package:flutter_wattvita/screens/login_reg_screen.dart';
import 'package:flutter_wattvita/screens/login_screen.dart';
import 'package:flutter_wattvita/screens/onboarding1.dart';
import 'package:flutter_wattvita/screens/profile_screen.dart';
import 'package:flutter_wattvita/screens/qrcode_scanner.dart';
import 'package:flutter_wattvita/screens/sensor_showall.dart';
import 'package:flutter_wattvita/screens/set_up_code.dart';
import 'package:flutter_wattvita/screens/signin_screen1.dart';
import 'package:flutter_wattvita/screens/signin_screen2.dart';
import 'package:flutter_wattvita/screens/splash_screen.dart';
import 'package:flutter_wattvita/screens/weather_card.dart';
import 'package:flutter_wattvita/screens/wifi_screen.dart';
import 'package:flutter_wattvita/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'screens/Devices/Sensor/Sensor.dart';
import 'screens/Devices/Small Home Appliances/Fan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AddSituationProvider>(
            create: (context) => AddSituationProvider(),
          ),
          ChangeNotifierProvider<AddResponseProvider>(
            create: (context) => AddResponseProvider(),
          ),
          ChangeNotifierProvider<SunsetSunriseProvider>(
            create: (context) => SunsetSunriseProvider(),
          ),
          ChangeNotifierProvider<RepeatSchedule>(
            create: (context) => RepeatSchedule(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(252, 249, 242, 1)),
            home: BottomNavBar()));
  }
}
