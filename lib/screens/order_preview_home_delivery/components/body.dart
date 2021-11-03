import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/chirstmas_special/components/home_header.dart';
import 'package:square_one_mobile_app/screens/order_preview_store_pickup/components/total_quantity.dart';

import '../../../size_config.dart';
import 'home_delivery_option.dart';
import 'order_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: DirectSelectContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  width: 500,
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Text(
                    "Home Delivery",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),SizedBox(height: 10),
              HomeDeliveryOption(),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Column(children: [
                  HomeHeader(),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  OrderList(),
                  TotalQuatity(),
                ]),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
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
      ),
    );
  }
}
