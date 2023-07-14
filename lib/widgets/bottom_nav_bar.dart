import 'package:flutter/material.dart';
import 'package:flutter_wattvita/screens/Smart/smart_screen.dart';
import 'package:flutter_wattvita/screens/profile_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/Scene/create scene/create_scene_screen.dart';
import '../screens/home_screen.dart';
import '../screens/qrcode_scanner.dart';
import '../services/profile_data.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController bottomNavController;
  String? token;
  String userName = '';

  @override
  void initState() {
    super.initState();
    // getData();
    bottomNavController = PersistentTabController(initialIndex: 0);
  }

  getData() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("token");
      print("token_____get--------------" + token!);
    });

    ProfileData.getdata(token!).then((value) {
      print("profile------------" + value!.toJson().toString());
      setState(() {
        userName = value.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(context,
            controller: bottomNavController,
            confineInSafeArea: true,
            stateManagement: true,
            navBarStyle: NavBarStyle.style16,
            decoration: NavBarDecoration(
                // adjustScreenBottomPaddingOnCurve: true,
                // colorBehindNavBar: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 0.2,
                  )
                ]),
            backgroundColor: Color.fromRGBO(252, 249, 242, 1),
            items: [
              PersistentBottomNavBarItem(
                  icon: Icon(
                    Iconsax.home,
                  ),
                  title: "Home",
                  activeColorPrimary: Colors.black,
                  inactiveColorPrimary: Colors.grey),
              PersistentBottomNavBarItem(
                  icon: Icon(Iconsax.airdrop),
                  title: "Scene",
                  activeColorPrimary: Colors.black,
                  inactiveColorPrimary: Colors.grey),
              PersistentBottomNavBarItem(
                icon: Icon(Iconsax.scanner, color: Colors.black),
                activeColorPrimary: Color.fromRGBO(252, 249, 242, 1),
              ),
              PersistentBottomNavBarItem(
                  icon: Icon(Iconsax.d_cube_scan),
                  title: "Smart",
                  activeColorPrimary: Colors.black,
                  inactiveColorPrimary: Colors.grey),
              PersistentBottomNavBarItem(
                  icon: Icon(Iconsax.profile_2user),
                  title: "Profile",
                  activeColorPrimary: Colors.black,
                  inactiveColorPrimary: Colors.grey)
            ],
            onItemSelected: (value) {},
            screens: [
              HomeScreen(),
              CreateSceneScreen(),
              QRScanner(),
              SmartScreen(),
              ProfileScreen(),
            ]),
      ),
    );
  }
}
