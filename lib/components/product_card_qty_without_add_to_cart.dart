import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/models/Cart.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCardQtyWithOutAddToCart extends StatefulWidget {
  const ProductCardQtyWithOutAddToCart({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final PrebookItem cart;

  @override
  _ProductCardQtyWithOutAddToCartState createState() =>
      _ProductCardQtyWithOutAddToCartState();
}

class _ProductCardQtyWithOutAddToCartState extends State<ProductCardQtyWithOutAddToCart> {
  int quantity = 0;

  void add() {
    setState(() {
      quantity++;
    });
  }

  void minus() {
    setState(() {
      if (widget.cart.quantity + quantity != 1) {
        quantity--;
      } else {
        showToast(
            "${widget.cart.displayName} cannot make less than 1 Quantity",
            context: context,
            alignment: Alignment.center,
            position:
                const StyledToastPosition(align: Alignment.topCenter, offset: 20.0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(1)),
      child: SizedBox(
        width: getProportionateScreenWidth(450),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.displayName,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "₹ ${widget.cart.unitPrice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x ${widget.cart.quantity + quantity}",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Qty ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const Spacer(),
                    RoundedIconBtnStyle2(
                      icon: Icons.remove,
                      showShadow: true,
                      press: () {
                        minus();
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Text(" ${widget.cart.quantity + quantity}",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
