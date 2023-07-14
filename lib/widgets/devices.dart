import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Devices extends StatefulWidget {
  String imgPath, name;
  Function()? onTap;
  Devices({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 120,
        width: 100,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(widget.imgPath),
            Expanded(
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.name,
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
