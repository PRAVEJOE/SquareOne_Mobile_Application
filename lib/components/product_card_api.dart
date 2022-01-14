import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/screens/cart/cart_screen.dart';

import '../constants.dart';
import '../size_config.dart';
import 'default_button-small.dart';

class ProductCardAPI extends StatefulWidget {
  final Datum treeItemItem;

   const ProductCardAPI(this.treeItemItem, {Key? key}) : super(key: key);

  @override
  _ProductCardAPIState createState() => _ProductCardAPIState();
}

final ItemController itemController = Get.put(ItemController());

class _ProductCardAPIState extends State<ProductCardAPI> {
  int quantity = 0;

  void add() {
    setState(() {
      widget.treeItemItem.quantity++;
    });
  }

  void minus() {
    setState(() {
      if (widget.treeItemItem.quantity != 0) widget.treeItemItem.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Hero(
                  //   tag: widget.treeItemItem.itemId.toString(),
                  //   child: Image.asset(widget.treeItemItem.i[0]),
                  // ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.treeItemItem.displayName,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${widget.treeItemItem.unitPrice}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Qty ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Spacer(),
                  RoundedIconBtnStyle2(
                    icon: Icons.remove,
                    showShadow: true,
                    press: () {
                      minus();
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  Text("${widget.treeItemItem.quantity} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  RoundedIconBtnStyle2(
                      icon: Icons.add,
                      showShadow: true,
                      press: () {
                        add();
                      }),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButtonSmall(
                    text: "Add To Cart",
                    press: () {
                      if (kDebugMode) {
                        print("Add to cart");
                      }
                      if (widget.treeItemItem.quantity == 0) {
                        showToast(
                            "Sorry !!! Add at least one quantity to the ${widget.treeItemItem.displayName}",
                            context: context,
                            alignment: Alignment.center,
                            position: const StyledToastPosition(
                                align: Alignment.topCenter, offset: 20.0));
                      } else {
                        itemController.addProductToCart(widget.treeItemItem);
                        if (kDebugMode) {
                          print(widget.treeItemItem);
                        }

                        Navigator.pushNamed(context, CartScreen.routeName);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
