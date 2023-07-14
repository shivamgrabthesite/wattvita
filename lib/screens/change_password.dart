import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool? pass, newPass, confirmPass;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass = true;
    newPass = true;
    confirmPass = true;
  }

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
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzwLRV3NE8vaEA7atXpz3EB6MIjx3GOzVI-yhSDLkupQ&usqp=CAU&ec=48665698"),
                    radius: 54,
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
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
                Text("Alex Volkov".toUpperCase(),
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                Text("alex@gmail.com",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
                SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password",
                      style: GoogleFonts.inter(
                          height: 3,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  width: width / 1.1,
                  height: height / 14,
                  child: TextFormField(
                    obscureText: pass!,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (pass == true) {
                                  pass = false;
                                } else {
                                  pass = true;
                                }
                              });
                            },
                            icon: pass == true
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )),
                        // hintText: "Password",
                        // hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
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
                  child: Text("New Password",
                      style: GoogleFonts.inter(
                          height: 3,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  width: width / 1.1,
                  height: height / 14,
                  child: TextFormField(
                    obscureText: newPass!,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (newPass == true) {
                                  newPass = false;
                                } else {
                                  newPass = true;
                                }
                              });
                            },
                            icon: newPass == true
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )),
                        // hintText: "Password",
                        // hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
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
                  child: Text("Confirm Password",
                      style: GoogleFonts.inter(
                          height: 3,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                Container(
                  width: width / 1.1,
                  height: height / 14,
                  child: TextFormField(
                    obscureText: confirmPass!,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (confirmPass == true) {
                                  confirmPass = false;
                                } else {
                                  confirmPass = true;
                                }
                              });
                            },
                            icon: confirmPass == true
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )),
                        // hintText: "Password",
                        // hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.black),
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
                  height: 30,
                ),
                Container(
                  width: width / 2,
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Save",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
