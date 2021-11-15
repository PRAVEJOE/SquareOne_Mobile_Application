import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/product.dart';
class RemoteServices {
  static var client = http.Client();
  static const API ="http://ec2-13-127-183-204.ap-south-1.compute.amazonaws.com/OrderwebAPI/api/";

  static Future fetchProducts() async {
    var response = await client.get(Uri.parse(
        API+'productstree'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      print("Failed");
      return null;
    }
  }

  static Future getPrebookItems(RequestParamPrebook item) async {
    Map<String, String> headers = {"content-type": "application/json"};

    final queryParameters = {'params': item.toJson()};

    print('bodiesss: $queryParameters');
    print(API + 'getprebookproducts');
    var response = await http.post(Uri.parse(API + 'getprebookproducts'),
        body: jsonEncode(queryParameters), headers: headers);
    if (response.statusCode == 200) {
      print("Success");
     // String responseBody = utf8.decoder.convert(response.bodyBytes);
      var jsonString = response.body;
      print(jsonString);
      return prebookProductFromJson(jsonString);
      //print(responseBody);
    } else {
      throw Exception("Fail");
    }
  }


}
