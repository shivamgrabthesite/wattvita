import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(252, 249, 242, 1),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Notification",
                  style: GoogleFonts.redHatDisplay(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/notificationIcon.svg',
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Notification",
                                          style: GoogleFonts.redHatDisplay(
                                              fontSize: 16, fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          "07:44 PM",
                                          style: GoogleFonts.redHatDisplay(
                                              fontSize: 10, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "When Ahmedabad temperature :<-40 has been trigged",
                                      style: GoogleFonts.redHatDisplay(
                                          fontSize: 12, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
