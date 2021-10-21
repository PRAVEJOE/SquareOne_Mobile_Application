import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'date_picker.dart';
import 'prebook_product.dart';
import 'home_header.dart';
import 'cateogry_selector.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20.0)),
            HomeHeader(),
            Date_Picker(),
            Category_Selector(),
            SizedBox(height: getProportionateScreenWidth(30.0)),
            PreBookProducts(),
            SizedBox(height: getProportionateScreenWidth(30.0)),
          ],
        ),
      ),
    );
  }
}
