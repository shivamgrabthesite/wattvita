import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/add_situation_provider.dart';

class TapToRun extends StatefulWidget {
  const TapToRun({super.key});

  @override
  State<TapToRun> createState() => _TapToRunState();
}

class _TapToRunState extends State<TapToRun> {
  @override
  Widget build(BuildContext context) {
    var situationProvider = Provider.of<AddSituationProvider>(context);

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(202, 199, 194, 1)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/taptorun.svg"),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Tap-To-Run",
                style: GoogleFonts.inter(fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      situationProvider.TaptoRun = true;
                      // situationProvider.listOfWidget.removeAt(situationProvider.index);
                      situationProvider.removeWidget(situationProvider.index);
                    },
                  );
                },
                iconSize: 20,
                icon: Icon(
                  Icons.close_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
