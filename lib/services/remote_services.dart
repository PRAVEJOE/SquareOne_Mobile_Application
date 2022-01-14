import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/model/prebookDateSlot.dart';
import 'package:square_one_mobile_app/model/product.dart';

class RemoteServices {
  static var client = http.Client();
  static const API =
      "http://ec2-3-109-158-202.ap-south-1.compute.amazonaws.com/OrderwebAPI/api/";

  static Future fetchProducts() async {
    var response = await client.get(Uri.parse(API + 'productstree'));
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
    try {
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
        return null;
      }
    } catch(e) {
      return null;
    }
  }

  static Future getPrebookDateSlot() async {
    try {
      print(API + 'getprebookDays');
      final response = await http.post(
        Uri.parse(API + 'getprebookDays'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{}),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return welcomeFromJson(jsonString);
      } else {
        if (kDebugMode) {
          print("Failed");
          throw Exception('Failed to create album.');
        }
        return null;
      }
    } catch(e) {
      return null;
    }
  }
  static Future getCustomerDetails(String number) async {
    var response = await client.get(Uri.parse(
        API+'GetCustomerByMobile/'+number));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return customerFromJson(jsonString);
    } else {
      print("Failed to fetch customer details");
      return null;
    }
  }
}
