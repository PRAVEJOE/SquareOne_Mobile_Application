import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/RequestUpdateAddress.dart';
import 'package:square_one_mobile_app/model/RequestUpdateProfile.dart';
import 'package:square_one_mobile_app/model/customerAddUpdate.dart';
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
//Prebook Item based on slot and date
  static Future getPrebookItems(RequestParamPrebook item) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      final queryParameters = {'params': item.toJson()};
      print('bodiesss: $queryParameters');
      print(API + 'getallprebookproducts');
      var response = await http.post(Uri.parse(API + 'getallprebookproducts'),
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
//Prebook Slot and date
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
  //Customer details fetch
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


//New Customer Add On and Update data
  static Future getCustomerUpdate(RequestUpdateProfile item) async {
    var isloading=true;
    try {
      isloading=true;
      Map<String, String> headers = {"content-type": "application/json"};
      final queryParameters = {'params': item.toJson()};
      print('bodiesss: $queryParameters');
      print(API + 'SaveCustomerInfo');
      var response = await http.put(Uri.parse(API + 'SaveCustomerInfo'),
          body: jsonEncode(queryParameters), headers: headers);
      if (response.statusCode == 200) {
        print("Success");
        // String responseBody = utf8.decoder.convert(response.bodyBytes);
        var jsonString = response.body;
        print(jsonString);
        return customerUpdateFromJson(jsonString);
        //print(responseBody);
      } else {
        isloading=false;
        return null;

      }
    } catch(e) {
      isloading=false;
      return null;
    }
  }
  //New Address Add On and Update data
  static Future getAddressUpdate(RequestUpdatedAddress item) async {
    var isloading = true;
    try {
      isloading = true;
      Map<String, String> headers = {"content-type": "application/json"};
      final queryParameters = {'params': item.toJson()};
      print('bodiesss: $queryParameters');
      print(API + 'SaveCustomerInfo');
      var response = await http.put(Uri.parse(API + 'SaveCustomerAddress'),
          body: jsonEncode(queryParameters), headers: headers);
      if (response.statusCode == 200) {
        print("Success");
        // String responseBody = utf8.decoder.convert(response.bodyBytes);
        var jsonString = response.body;
        print(jsonString);
        return customerUpdateFromJson(jsonString);
        //print(responseBody);
      } else {
        isloading = false;
        return null;
      }
    } catch (e) {
      isloading = false;
      return null;
    }
  }
  }
