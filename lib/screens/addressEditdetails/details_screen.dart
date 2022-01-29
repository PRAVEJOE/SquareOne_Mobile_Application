import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';

import 'components/body.dart';

class AddressEditDetailsScreen extends StatelessWidget {
  static String routeName = "/addressEditDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final AddressDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as AddressDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: buildAppBar(context),
      body: Body(address: agrs.address),
    );
  }
}

class AddressDetailsArguments {
  final Address address;

  AddressDetailsArguments({required this.address});
}

AppBar buildAppBar(BuildContext context) {
  final AddressDetailsArguments agrs =
      ModalRoute.of(context)!.settings.arguments as AddressDetailsArguments;
  return AppBar(
    title: Column(
      children: [
        Text(
          "Your Address",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          agrs.address.fullName + " to Edit",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ),
  );
}
