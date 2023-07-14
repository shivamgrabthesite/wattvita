import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_response_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScene extends StatefulWidget {
  const AddScene({super.key});

  @override
  State<AddScene> createState() => _AddSceneState();
}

class _AddSceneState extends State<AddScene> {
  String name = '';

  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("NAME")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
                borderRadius: BorderRadius.circular(10)),
            child: Consumer<AddResponseProvider>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    value.tableLamp == false
                        ? SvgPicture.asset("assets/images/devices/tablelamp.svg")
                        : null!,
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      name == '' ? "New Control" : name,
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.forward,
                      size: 30,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
