import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wattvita/screens/signin_screen2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_reg.dart';
import '../services/post_reg_id.dart';

class SigninScreen1 extends StatefulWidget {
  const SigninScreen1({super.key});

  @override
  State<SigninScreen1> createState() => _SigninScreen1State();
}

class _SigninScreen1State extends State<SigninScreen1> {
  TextEditingController reg_fname_controller = TextEditingController();
  TextEditingController reg_lname_controller = TextEditingController();
  TextEditingController reg_phone_controller = TextEditingController();

  late PostReg postreg;
  String? id;
  String? f_l_name, phone;

  void sharedpref() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("reg_fname_lname_controller",
          reg_fname_controller.text + " " + reg_lname_controller.text);
      pref.setString("reg_phone_controller", reg_phone_controller.text);
    });
  }

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
        print("id:   " + id!);
      } else {
        print("------------------not getting value-------------------");
      }
    }).onError((error, stackTrace) {
      print("error: " + error.toString());
    }).catchError((err) {
      print("eeeerrrroooo: " + err);
    });
    setState(() {
      pref.setString("userid", id!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
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
                    controller: reg_fname_controller,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = reg_fname_controller.text;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "First Name",
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
                    controller: reg_lname_controller,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    onChanged: (value) {
                      setState(() {
                        value = reg_lname_controller.text;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Last Name",
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
                    controller: reg_phone_controller,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        value = reg_phone_controller.text;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Phone Number",
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
                          sharedpref();
                          // getDetails();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SigninScreen2(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
