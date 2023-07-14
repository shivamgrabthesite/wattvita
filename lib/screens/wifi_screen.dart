import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:open_settings/open_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/appbar.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  State<WifiScreen> createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  final info = NetworkInfo();
  bool isVisible = true;
  final _ssidController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool result = false;

  @override
  void initState() {
    super.initState();
    permissions();
    checkwifi();
  }

  permissions() {
    Permission.location;
  }

  checkwifi() async {
    result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('wifi connnected');
    } else {
      print('No internet');
    }
  }

  wifiname() async {
    final wifiName = await info.getWifiName();
    setState(() {
      _ssidController.text = wifiName.toString();
      _ssidController.text = _ssidController.text.replaceAll('"', ' ');
      if (_ssidController.text == 'null') {
        _ssidController.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select 2.4 GHz Wi-Fi Network and enter password.",
                  style: GoogleFonts.redHatDisplay(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "If your Wi-Fi is 5GHz, please set it to be 2.4GHz. Common router setting method",
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w200),
                ),
                SvgPicture.asset("assets/images/wifi.svg"),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: wifiname(),
                  builder: (context, snapshot) {
                    return Container(
                      width: width / 1.1,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        controller: _ssidController,
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 16),
                        readOnly: true,
                        onChanged: (value) {
                          setState(() {
                            _ssidController.text = snapshot.toString();
                          });
                        },
                        validator: (value) {
                          if (value == '') {
                            return "Your mobile phone is not connected with Wi-Fi, Please connect with Wi-FI";
                          }
                        },
                        decoration: InputDecoration(
                            errorMaxLines: 2,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                "assets/images/homewifi.svg",
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                OpenSettings.openWIFISetting();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/images/edit2.svg",
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2)),
                            border: OutlineInputBorder(
                                gapPadding: 20,
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black, width: 1.2))),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width / 1.1,
                  // height: height / 14,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: isVisible,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 16),
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
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: width / 1.4,
                    height: 44,
                    child: ElevatedButton(
                        onPressed: () {
                          // wifiname();
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
          ),
        ),
      ),
    );
  }
}
