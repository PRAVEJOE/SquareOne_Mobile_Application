import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/prebook/components/slot_chooser.dart';

import '../../../size_config.dart';
import 'cateogry_selector_2.dart';
import 'date_picker.dart';
import 'home_header.dart';
import 'prebook_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(2)),
                child: Text(
                  "This Week's Menu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            Date_Picker(),
            Slot_Chooser(),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            CategorySelector_2(),
           // PreBookProducts(),
            SizedBox(height: getProportionateScreenWidth(30.0)),
          ],
        ),
      ),
    );
  }
}
