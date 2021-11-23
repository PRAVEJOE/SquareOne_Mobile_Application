import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';
import 'check_out_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}
final ItemController itemController = Get.put(ItemController());
class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: itemController.cart.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(itemController.cart[index].itemId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {

                itemController.cart.removeAt(index);
                //itemController.totalPrice();
                //CheckoutCard(totalPrice: itemController.totalPrice(),);
                CheckoutCard(totalPrice: itemController.totalPrice(),);
               // demoCarts.removeAt(index);
              });

            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),


            child: CartCard(cart: itemController.cart[index],),
          ),
        ),
      ),
    );
  }
}
