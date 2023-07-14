import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                  "Verification Code",
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
                  "Enter your 4 digits code",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: width / 1.2,
                    child: Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      defaultPinTheme: PinTheme(
                          height: 60,
                          width: 60,
                          textStyle: GoogleFonts.inter(
                            fontSize: 20,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black))),
                    ),
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
                        onPressed: () {},
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
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
