// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DevicePair extends StatefulWidget {
  String? img;
  String? devicename;
  String? subtitle;
  Function()? onPressed;

  DevicePair({
    Key? key,
    required this.img,
    required this.devicename,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<DevicePair> createState() => _DevicePairState();
}

class _DevicePairState extends State<DevicePair> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          SvgPicture.asset(widget.img!),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.devicename!,
                style: GoogleFonts.inter(fontSize: 14),
              ),
              Text(
                widget.subtitle!,
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 85,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
              onPressed: widget.onPressed,
              child: Text(
                "Pair",
                style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ]));
  }
}
