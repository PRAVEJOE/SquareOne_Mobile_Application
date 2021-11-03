import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/payment_check_out_card.dart';

class OrderPreview extends StatelessWidget {
  static String routeName = "/orderpreviews";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: PaymentCheckOut(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Order Previews",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "2 Orders For Store-PickUp",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
