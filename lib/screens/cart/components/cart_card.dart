import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class CartCard extends StatefulWidget {
  final Datum cart;

  const CartCard({Key? key,required this.cart,}) : super(key: key);
  //final Cart cart;

  @override
  _CartCardState createState() => _CartCardState();
}

final ItemController itemController = Get.put(ItemController());
class _CartCardState extends State<CartCard> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(2)),
      decoration: BoxDecoration(
        // color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                //child: Image.asset(treeItemItem.),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.displayName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\₹ ${widget.cart.unitPrice}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                      text: " x${widget.cart.quantity}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "Date :",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: "20-10-2021,",
                        style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(
                        text: " 02:00 PM",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
