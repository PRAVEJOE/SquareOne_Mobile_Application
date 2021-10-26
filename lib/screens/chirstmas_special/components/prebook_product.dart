import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/components/product_card.dart';
import 'package:square_one_mobile_app/models/Product.dart';

import '../../../size_config.dart';

class PreBookProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 25,
                children: [
                  ...List.generate(
                    demoProducts2.length,
                        (index) {
                      if (demoProducts2[index].isPopular)
                        return ProductCard(product: demoProducts2[index]);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    }
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            )),
      ],
    );
  }
}
