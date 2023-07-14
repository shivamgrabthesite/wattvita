import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'otp_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(252, 249, 242, 1),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/forgotpass.svg"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Forgot Password",
                  style: GoogleFonts.redHatDisplay(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Worries, We got your back !",
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Reset the password !",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                        hintText: "Email",
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
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: width / 1.4,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OTPScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Continue",
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
