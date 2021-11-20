import 'package:flutter/material.dart';

import 'components/body.dart';

class Delivery_Options extends StatelessWidget {
  static String routeName = "/delivery_options";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Choose Delivery Option",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
