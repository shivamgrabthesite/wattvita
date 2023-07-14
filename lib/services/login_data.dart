import '../constants/api_links.dart';
import '../models/get_token.dart';
import 'package:http/http.dart' as http;

class LoginData {
  static Future<GetToken?> getData(String email, String pass) async {
    Uri url = Uri.parse(loginapi);
    Map<String, String> requestBody = {
      "email": email,
      "password": pass,
    };
    var response = await http.post(
      url,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      GetToken getdata = getTokenFromJson(response.body);
      return getdata;
    } else {}
  }
}
