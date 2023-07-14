import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/home_screen.dart';
import 'package:flutter_wattvita/screens/login_screen.dart';
import 'package:flutter_wattvita/screens/signin_screen1.dart';
import 'package:flutter_wattvita/screens/signin_screen2.dart';
import 'package:flutter_wattvita/widgets/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegScreen extends StatefulWidget {
  const LoginRegScreen({super.key});

  @override
  State<LoginRegScreen> createState() => _LoginRegScreenState();
}

class _LoginRegScreenState extends State<LoginRegScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return BottomNavBar();
                            },
                          ));
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            side: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                            )),
                        child: Text(
                          "Skip for now",
                          style: GoogleFonts.nunito(
                              color: Colors.black.withOpacity(0.6), fontSize: 12),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              SvgPicture.asset('assets/images/log_reg.svg', height: height / 2.5),
              SizedBox(
                height: height / 40,
              ),
              SvgPicture.asset("assets/images/splash.svg"),
              SizedBox(
                height: height / 40,
              ),
              Text(
                textAlign: TextAlign.center,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet",
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: height / 20,
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
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(
                              color: Colors.black,
                            )),
                        child: Text(
                          "Login",
                          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                        )),
                  ),
                  Container(
                    width: 150,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return SigninScreen1();
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Sign Up",
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
