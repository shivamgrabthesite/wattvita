import '../constants/api_links.dart';
import 'package:http/http.dart' as http;
import '../models/userdata.dart';

class ProfileData {
  static Future<UserData?> getdata(String id) async {
    Uri url = Uri.parse(profileData);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $id',
    });
    if (response.statusCode == 200) {
      UserData getdata = userDataFromJson(response.body);
      return getdata;
    } else {}
  }
}
