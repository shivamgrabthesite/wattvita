import 'package:http/http.dart' as http;
import '../constants/api_links.dart';
import '../models/post_reg.dart';

class PostRegId {
  static Future<PostReg?> regId(String name, String phone) async {
    Uri url = Uri.parse(postReg);
    Map<String, String> requestBody = {
      "name": name,
      "phone": phone,
    };
    // var body = json.encode(requestBody);

    var response = await http.post(
      url,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      PostReg getdata = postRegFromJson(response.body);
      return getdata;
    } else {}
  }
}
