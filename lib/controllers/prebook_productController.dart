import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class PrebookProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <PrebookItem>[].obs;
  var dateSlot = <PrebookItem>[].obs;
  var ab = 0;

  var prebookDate = "";
  String prebookTime = "";

  @override
  Future<void> onInit() async {
    // getPrebookItems();
    //getPrebookDateSot();
    super.onInit();
  }

  void listPrebookItemDate(String index) async {
    prebookDate = index;
  }

  void listPrebookItemTime(String time) async {
    prebookTime = time;
  }

  Future<void> getPrebookItems() async {
    final requestParamPrebook =
        RequestParamPrebook(date: prebookDate);

    final result1 = await RemoteServices.getPrebookItems(requestParamPrebook);
    if (kDebugMode) {
      print(result1);
    }
    productList.value = result1.Cartitems;
  }
// Future<void> getPrebookDateSot() async {
//
//   final result1 =
//   await RemoteServices.getPrebookDateSlot();
//   print(result1);
//   dateslot.value = result1.data;
//
//
// }
}
