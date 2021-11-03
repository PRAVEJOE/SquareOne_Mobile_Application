import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/order_preview_home_delivery/order_preview_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_home_delivery_multi/order_preview_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_store_pickup/order_preview_screen.dart';

import 'delivery_menu.dart';
import 'homedelivery_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          HomeDeliveryPic(),
          SizedBox(height: 20),
          DeliveryMenu(
            text: "Store PickUp",
            icon: "assets/icons/User Icon.svg",
            press: () => {Navigator.pushNamed(context, OrderPreview.routeName)},
          ),
          DeliveryMenu(
            text: "Home Delivery",
            icon: "assets/icons/delivery.svg",
            press: () => {
              Navigator.pushNamed(context, OrderPreviewHomeDelivery.routeName)
            },
          ),
          DeliveryMenu(
            text: "Multiple Delivery Option",
            icon: "assets/icons/delivery.svg",
            press: () {
              Navigator.pushNamed(
                  context, OrderPreviewHomeDeliveryMulti.routeName);
            },
          ),
        ],
      ),
    );
  }
}
