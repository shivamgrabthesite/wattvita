import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/login_reg_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final controller = PageController(keepPage: true, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: PageView(
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 7.5,
                          ),
                          SvgPicture.asset(
                            "assets/images/Group2.svg",
                            height: height / 2.6,
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "A Greener future starts at home.",
                            style: GoogleFonts.lato(fontSize: 36),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 4.5,
                          ),
                          SvgPicture.asset(
                            "assets/images/Group1.svg",
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Your home, your energy, your control.",
                            style: GoogleFonts.lato(fontSize: 36),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 9,
                          ),
                          SvgPicture.asset("assets/images/Group3.svg", height: height / 2.6),
                          SizedBox(
                            height: height / 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "The smart way to manage your energy.",
                            style: GoogleFonts.lato(fontSize: 36),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black)),
              SizedBox(
                height: height / 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 48,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginRegScreen(),
                          ));
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(
                              color: Colors.black,
                            )),
                        child: Text(
                          "Skip",
                          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                        )),
                  ),
                  Container(
                    width: 150,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500), curve: Curves.ease);
                          if (controller.page! == 2) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return LoginRegScreen();
                              },
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.nunito(color: Colors.white, fontSize: 16),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
