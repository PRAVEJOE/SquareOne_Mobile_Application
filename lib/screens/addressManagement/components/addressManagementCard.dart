import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/screens/addressEditdetails/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AddressManagementCard extends StatefulWidget {
  final Address address;

  const AddressManagementCard({
    Key? key,
    required this.address,
  }) : super(key: key);

  //final Cart cart;

  @override
  _AddressManagementCardState createState() => _AddressManagementCardState();
}

final ItemController itemController = Get.put(ItemController());

class _AddressManagementCardState extends State<AddressManagementCard> {
  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AddressEditDetailsScreen.routeName,
                  arguments: AddressDetailsArguments(address: widget.address),
                );
              },
              child: SizedBox(
                width: getProportionateScreenWidth(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.address.fullName,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(widget.address.address),
                    Text("Contact No :" + widget.address.contactNumber),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
