import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/privacy_permission_settings.dart';
import 'package:flutter_wattvita/screens/profile_edit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/logout_data.dart';
import '../widgets/notification_badge.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool c = false;
  bool f = false;
  String? refreshtoken;

  logoutUser() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      refreshtoken = pref.getString("refreshtoken");
      print("refreshtokenp---------------" + refreshtoken!);
    });

    LogoutData.logout(refreshtoken!).then((value) {
      print("datttaaa--------------" + value.toString());
    }).onError((error, stackTrace) {
      print("logout error-------------" + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(252, 249, 242, 1),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ));
                },
                child: NotificationBadge(
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 14, right: 14),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 40,
                ),
                Stack(alignment: Alignment.centerLeft, children: [
                  CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black)),
                    ),
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzwLRV3NE8vaEA7atXpz3EB6MIjx3GOzVI-yhSDLkupQ&usqp=CAU&ec=48665698",
                    ),
                    radius: 54,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.2))),
                      child: SvgPicture.asset(
                        'assets/images/edit.svg',
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Alex Volkov".toUpperCase() + "  ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                          Text("alex@gmail.com",
                              style: GoogleFonts.inter(
                                  fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 40,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileEdit(),
                            ));
                          },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              side: BorderSide(
                                color: Colors.black,
                              )),
                          child: Text(
                            "Edit",
                            style: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 26,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("Account & Security",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                      Spacer(),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                SizedBox(
                  height: height / 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PrivacyPermissionSettings(),
                    ));
                  },
                  child: Row(
                    children: [
                      Text("Privacy Policy Setting",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                      Spacer(),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                SizedBox(
                  height: height / 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("Privacy Policy",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                      Spacer(),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                SizedBox(
                  height: height / 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("Terms & Condition",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                      Spacer(),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                SizedBox(
                  height: height / 50,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: height / 2.5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                            side: BorderSide(color: Colors.white))),
                                    child: CheckboxListTile(
                                      activeColor: Colors.white,
                                      checkColor: Colors.black,
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      title: Text("°C",
                                          style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      value: c,
                                      onChanged: (value) {
                                        setState(() {
                                          c = value!;
                                          if (c == true) {
                                            f = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                            side: BorderSide(color: Colors.white))),
                                    child: CheckboxListTile(
                                      activeColor: Colors.white,
                                      checkColor: Colors.black,
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      title: Text("°F",
                                          style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      value: f,
                                      onChanged: (value) {
                                        setState(() {
                                          f = value!;
                                          if (f == true) {
                                            c = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: width / 2.5,
                                        height: height / 14,
                                        child: OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8)),
                                                side: BorderSide(
                                                  color: Colors.white.withOpacity(0.8),
                                                )),
                                            child: Text(
                                              "Cancel",
                                              style: GoogleFonts.nunito(
                                                  color: Colors.white, fontSize: 16),
                                            )),
                                      ),
                                      // Spacer(),
                                      Container(
                                        width: width / 2.5,
                                        height: height / 14,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                            ),
                                            child: Text(
                                              "Save",
                                              style: GoogleFonts.nunito(
                                                  color: Colors.black, fontSize: 16),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text("Temperature Unit",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                      Spacer(),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width / 1.4,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          logoutUser();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                        )),
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
