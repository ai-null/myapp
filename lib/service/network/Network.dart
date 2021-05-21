import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/model/ProductModel.dart';
import 'package:myapp/service/ServiceConstant.dart';

class Network {
  static Future<List<ProductModel>> getProduct() async {
    // fetch data
    var apiResult = await http
        .post(Uri.parse(ServiceConstant.BASE_URL + ServiceConstant.PATH))
        .timeout(Duration(seconds: 30));
    var data = json.decode(apiResult.body);

    // map data to list
    return data
        .map<ProductModel>((item) => ProductModel(
            id: item['id'],
            title: item["title"],
            location: item["location_name"],
            merchant: item["added_user_name"],
            photo: item["default_photo"]["img_path"],
            price: int.parse(item["price"]),
            isHalal: item["is_halal"],
            category: item["category"]["cat_name"],
            stock: item["stock"],
            weight: item["weight"]))
        .toList();
  }
}
