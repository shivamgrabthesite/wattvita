import 'package:http/http.dart' as http;
import '../constants/api_links.dart';

class PutReg {
  static Future putData(String email, String pass, String confirm_pass) async {
    Uri url = Uri.parse(postReg2);
    Map<String, String> requestBody = {
      "email": email,
      "password": pass,
      "repeat_password": confirm_pass
    };
    var response = await http.put(
      url,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      var getdata = response.body;
      return getdata;
    } else {}
  }
}
