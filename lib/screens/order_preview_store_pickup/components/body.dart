import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/chirstmas_special/components/home_header.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_home_delivery/components/back.dart';
import 'package:square_one_mobile_app/screens/order_preview_store_pickup/components/total_quantity.dart';

import '../../../size_config.dart';
import 'order_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: 500,
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                   // color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    Text(
                      "Store PickUp",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Back(
                      text: "More Options",
                      icon: "assets/icons/arrow-back-ios.svg",
                      press: () => {
                      Navigator.pop(context)
                      },
                    ),
                  ],
                )),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                //  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Column(children: [
                HomeHeader(),
                SizedBox(height: 10),
                OrderList(),
                TotalQuatity(),
              ]),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
              //    color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Column(children: [
                SizedBox(height: 10),
                HomeHeader(),
                SizedBox(height: 10),
                OrderList(),
                TotalQuatity()
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
