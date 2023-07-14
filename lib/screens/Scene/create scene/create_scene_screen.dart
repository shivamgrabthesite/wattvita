import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/Scene/create%20scene/scene_screen2.dart';
import 'package:flutter_wattvita/screens/automation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/notification_badge.dart';
import '../../notification_screen.dart';

class CreateSceneScreen extends StatefulWidget {
  const CreateSceneScreen({super.key});

  @override
  State<CreateSceneScreen> createState() => _CreateSceneScreenState();
}

class _CreateSceneScreenState extends State<CreateSceneScreen> {
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
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 30,
                ),
                SvgPicture.asset("assets/images/scene.svg"),
                SizedBox(
                  height: height / 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet",
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: height / 10,
                ),
                Row(
                  children: [
                    Container(
                      width: width / 2.4,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SceneScreen2(),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Create Scene",
                            style: GoogleFonts.nunito(
                                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                    ),
                    Spacer(),
                    Container(
                      width: width / 2.4,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AutomationScreen(),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(252, 249, 242, 1),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Automation",
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
