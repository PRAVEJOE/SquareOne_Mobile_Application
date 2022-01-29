import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/size_config.dart';

import '../../../constants.dart';
import 'addressDetailsEdit.dart';

class Body extends StatelessWidget {
  final Address address;

  const Body({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Hi," + address.fullName, style: headingStyle),
                Text(
                  "Update your details to continue",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                AddressDetailsEdit(address: address),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
