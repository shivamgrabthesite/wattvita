import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key});

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: Appbar()),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 40,
              ),
              SvgPicture.asset(
                'assets/images/imgprf.svg',
              ),
              // Stack(alignment: Alignment.centerLeft, children: [
              //   CircleAvatar(
              //     backgroundImage: NetworkImage(
              //         "https://cdn-sfo.socy.cloud/PRAS/v1/_20/p/202206/upload/PRAS/uf_1656424683kgSavnn0zmC0yPIFZlx0anzZI7.jpg"),
              //     radius: 54,
              //   ),
              //   Positioned(
              //     bottom: 4,
              //     right: 4,
              //     child: Container(
              //       padding: EdgeInsets.all(8),
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(50),
              //           border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.2))),
              //       child: SvgPicture.asset(
              //         'assets/images/edit.svg',
              //       ),
              //     ),
              //   ),
              // ]),
              SizedBox(
                height: height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Khabib Nurmagomedov".toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                        Text("alex@gmail.com",
                            style: GoogleFonts.inter(
                                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 40,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(
                              color: Colors.black,
                            )),
                        child: Text(
                          "Edit",
                          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: height / 26,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Account & Security",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              SizedBox(
                height: height / 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Contact Us",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              SizedBox(
                height: height / 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Privacy Policy",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              SizedBox(
                height: height / 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Terms & Condition",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              SizedBox(
                height: height / 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("FAQ",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
              SizedBox(
                height: height / 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text("Logout",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black)),
                    Spacer(),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
