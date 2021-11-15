import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/prebook_productController.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class PreBookProducts extends StatefulWidget {
  const PreBookProducts({Key? key}) : super(key: key);

  @override
  _PreBookProductsState createState() => _PreBookProductsState();
}

class _PreBookProductsState extends State<PreBookProducts> {
  @override
  initState() {
    //loadPrebookProducts();//load prebook products
    PreBookProducts();
    _PreBookProductsState();
    input();
  }

  int ab = 0;
  // DateTime dateReturned = DateTime.now();
  // String timeReturned ="10:00 AM";

  void CategorySelected(int index) async {
    ab = index;
    PreBookProducts();
    _PreBookProductsState();
    input();
  }

  // void listprebookItemDate(DateTime index) async {
  //   dateReturned = index;
  //   input();
  // }
  //
  // void listprebookItemTime(String index) async {
  //   timeReturned = index;
  //   input();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [input()],
    );
  }


  //
  // Future<void> loadPrebookProducts() async {
  //   final requestParamPrebook = RequestParamPrebook(
  //       date: dateReturned,
  //       time: timeReturned);
  //
  //   final result1 =
  //   await RemoteServices.getPrebookItems(requestParamPrebook);
  //
  // }
}

input() {
  final PrebookProductController productController = Get.put(PrebookProductController());
  return SingleChildScrollView(
      child: Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 25,
      children: [
        ...List.generate(productController.productList.length, (index) {
          return ProductCardAPI(productController.productList[index]);
          // here by default width and height is 0
        }),
      ],
    ),
  ));
}
