import '../constants/api_links.dart';
import 'package:http/http.dart' as http;

class LogoutData {
  static Future logout(String id) async {
    Uri url = Uri.parse(logoutapi);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $id',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
