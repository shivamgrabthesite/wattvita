import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/forgot_password.dart';
import 'package:flutter_wattvita/widgets/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/login_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isVisible;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? token, refreshToken;
  String? emailStr, passStr;

  @override
  void initState() {
    super.initState();
    isVisible = true;
  }

  getToken() async {
    LoginData.getData(email.text.toString(), password.text.toString()).then((value) {
      setState(() {
        token = value!.accessToken;
        refreshToken = value.refreshToken;
      });

      print("token____set----------" + token!);
      print("rrrrrrrtoken____set----------" + refreshToken!);
    }).onError((error, stackTrace) {
      print("login error-------------" + error.toString());
    });
    var pref = await SharedPreferences.getInstance();
    pref.setString("token", token!);
    pref.setString("refreshtoken", refreshToken!);
  }

  // getData() async {
  //   var token;
  //   var pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = pref.getString("tokenz")!;
  //     print("token222222------------" + token);
  //   });
  //   ProfileData.getdata(token).then((value) {
  //     print("profie------------" + value!.toJson().toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                        height: height / 3, child: SvgPicture.asset("assets/images/login.svg"))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's sign you in.",
                  style: GoogleFonts.redHatDisplay(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "First time here.",
                  style: GoogleFonts.inter(fontSize: 26),
                ),
                Text(
                  "Let's get to know each other !",
                  style: GoogleFonts.inter(fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    controller: email,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = email.text;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                        hintText: "Email",
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
                  height: 14,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    controller: password,
                    obscureText: isVisible!,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = password.text;
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isVisible == true) {
                                  isVisible = false;
                                } else {
                                  isVisible = true;
                                }
                              });
                            },
                            icon: isVisible == true
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )),
                        hintText: "Password",
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
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: width / 1.4,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          getToken();
                          if (token == '') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text("Invalidate data!!!")));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.2)),
                        borderRadius: BorderRadius.circular(50)),
                    child: Logo(Logos.google, size: 20),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
