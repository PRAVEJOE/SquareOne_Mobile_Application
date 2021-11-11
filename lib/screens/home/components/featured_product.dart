import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:square_one_mobile_app/components/product_card.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/models/Product.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class FeaturedProducts extends StatelessWidget {
  final TreeController productController = Get.put(TreeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Featured Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                productController.productList.length,
                (index) {
                  if (productController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return ProductTile(productController.productList[index]);
                  // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
