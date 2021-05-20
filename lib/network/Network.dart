import 'package:http/http.dart' as http;

class Network {
  static Future<String> getProduct() async {
    const BASE_URL = "https://ranting.twisdev.com/index.php/rest/items/search/api_key/teampsisthebest/";
    var apiResult = await http.post(Uri.parse(BASE_URL)).timeout(Duration(seconds: 30));

    return apiResult.body;
  }
}