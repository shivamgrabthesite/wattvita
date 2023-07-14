import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';
import 'change_password.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzwLRV3NE8vaEA7atXpz3EB6MIjx3GOzVI-yhSDLkupQ&usqp=CAU&ec=48665698"),
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
                  height: 20,
                ),
                Text("Alex Volkov".toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                Text("alex@gmail.com",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("First Name",
                      style: GoogleFonts.inter(
                          height: 3,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Enter Your First Name",
                        hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Last Name",
                      style: GoogleFonts.inter(
                          height: 2,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Enter Your Last Name",
                        hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email ID",
                      style: GoogleFonts.inter(
                          height: 2,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.black, width: 1.2))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: width / 2.4,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChangePass(),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(252, 249, 242, 1),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Change Password",
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                          )),
                    ),
                    Spacer(),
                    Container(
                      width: width / 2.4,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => SceneScreen2(),
                            // ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Save",
                            style: GoogleFonts.nunito(
                                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
