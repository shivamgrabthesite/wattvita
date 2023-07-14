import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';
import '../widgets/notification_badge.dart';

class SetUpCode extends StatefulWidget {
  const SetUpCode({super.key});

  @override
  State<SetUpCode> createState() => _SetUpCodeState();
}

class _SetUpCodeState extends State<SetUpCode> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Setup Code",
                style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet",
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: width / 1.1,
                height: height / 14,
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/images/edit.svg',
                        ),
                      ),
                      hintText: "Enter Code",
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
              Center(
                child: Container(
                  width: 300,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
