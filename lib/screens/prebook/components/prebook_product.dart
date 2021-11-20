import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

class PreBookProducts extends StatefulWidget {
  const PreBookProducts( {Key? key}) : super(key: key);

  @override
  _PreBookProductsState createState() => _PreBookProductsState();
}

class _PreBookProductsState extends State<PreBookProducts> {

  @override
  initState() {
    PreBookProducts();
    _PreBookProductsState();
    input();
  }
  int ab=0;
  void CategorySelected(int index) async {
    ab= index;
    PreBookProducts();
    _PreBookProductsState();
    input();
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [input()
      ],

    );
  }
}

input() {
  final TreeController productController = Get.put(TreeController());
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
      )
  );
}
