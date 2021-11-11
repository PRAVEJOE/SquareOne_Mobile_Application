import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/components/product_card_qty.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/models/Product.dart';

class PreBookProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TreeController productController = Get.put(TreeController());
    return Column(
      children: [
        SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 25,
            children: [
              ...List.generate(productController.productList.length, (index) {
                  return ProductCardAPI(productController.productList[index]);

                return SizedBox
                    .shrink(); // here by default width and height is 0
              }),
            ],
          ),
        )),
      ],
    );
  }
}
