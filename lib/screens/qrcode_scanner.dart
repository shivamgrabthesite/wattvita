import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wattvita/screens/set_up_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../widgets/appbar.dart';
import '../widgets/notification_badge.dart';
import 'notification_screen.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  late MobileScannerController controller;
  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
        facing: CameraFacing.back, autoStart: true, torchEnabled: false, returnImage: true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 300,
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MobileScanner(
                      fit: BoxFit.cover,
                      controller: controller,
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }

                        // if (image != null) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => Image(image: MemoryImage(image)),
                        //   );
                        //   Future.delayed(const Duration(seconds: 5), () {
                        //     Navigator.pop(context);
                        //   });
                        // }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "The QR Code will be automaticly detected when you position it between the guide lines",
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SetUpCode(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Enter Setup code",
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
