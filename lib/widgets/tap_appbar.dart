import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/provider/add_response_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/add_situation_provider.dart';
import '../screens/notification_screen.dart';
import 'notification_badge.dart';

class TapAppbar extends StatefulWidget {
  const TapAppbar({super.key});

  @override
  State<TapAppbar> createState() => _TapAppbarState();
}

class _TapAppbarState extends State<TapAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
                onPressed: () {
                  discardDialog(context);
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                )),
          ),
        ),
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
    );
  }

  Future<dynamic> discardDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 340,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    height: 210,
                    width: 280,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Discard Changes ?",
                          style: GoogleFonts.redHatDisplay(
                              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "No problem, you can easily discard any changes and go back",
                          style: GoogleFonts.inter(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 35,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      side: BorderSide(
                                        color: Colors.black,
                                      )),
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.nunito(color: Colors.black, fontSize: 12),
                                  )),
                            ),
                            Spacer(),
                            Container(
                              width: 120,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Text(
                                    "Discard",
                                    style: GoogleFonts.nunito(color: Colors.white, fontSize: 12),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset("assets/images/discard.svg")),
              ],
            ),
          ),
        );
      },
    );
  }
}
