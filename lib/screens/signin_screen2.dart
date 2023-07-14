import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_reg.dart';
import '../services/post_reg_id.dart';
import '../services/put_reg.dart';

class SigninScreen2 extends StatefulWidget {
  SigninScreen2({super.key});

  @override
  State<SigninScreen2> createState() => SigninScreen2State();
}

class SigninScreen2State extends State<SigninScreen2> {
  TextEditingController reg_email_controller = TextEditingController();
  TextEditingController reg_pass_controller = TextEditingController();
  TextEditingController reg_confirm_pass_controller = TextEditingController();
  bool isVisible = true;
  bool isVisibleConfirm = true;
  late PostReg postreg;
  String? id;
  String? f_l_name, phone;
  static String userid = '';

  getDetails() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      f_l_name = pref.getString("reg_fname_lname_controller");
      phone = pref.getString("reg_phone_controller");
    });

    print("prefs: " + f_l_name! + " " + phone!);
    PostRegId.regId(f_l_name!, phone!).then((value) {
      if (value != null) {
        postreg = value;
        id = postreg.data.id;
        print("id:----------------" + id!);
        setState(() {
          pref.setString("userid", id!);
        });
      } else {
        print("------------------not getting value-------------------");
      }
    }).onError((error, stackTrace) {
      print("error: " + error.toString());
    });
  }

  putDetails() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      print("userid--------------" + userid);
      userid = pref.getString("userid")!;
    });
    var msg = '';
    PutReg.putData(reg_email_controller.text.toString(), reg_pass_controller.text.toString(),
            reg_confirm_pass_controller.text.toString())
        .then((value) {
      msg = value.toString();
      print("message:    " + msg);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

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
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                        height: height / 4, child: SvgPicture.asset("assets/images/signup.svg"))),
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
                  height: 30,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    controller: reg_email_controller,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = reg_email_controller.text;
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
                  height: 10,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    controller: reg_pass_controller,
                    obscureText: isVisible,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = reg_pass_controller.text;
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: width / 1.1,
                  height: 60,
                  child: TextFormField(
                    controller: reg_confirm_pass_controller,
                    obscureText: isVisibleConfirm,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = reg_confirm_pass_controller.text;
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
                                if (isVisibleConfirm == true) {
                                  isVisibleConfirm = false;
                                } else {
                                  isVisibleConfirm = true;
                                }
                              });
                            },
                            icon: isVisibleConfirm == true
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )),
                        hintText: "Confirm Password",
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
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: width / 1.4,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          putDetails();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Sign Up",
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
