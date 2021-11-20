import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/models/Cart.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard_Qty_W0_Cart extends StatefulWidget {
  const ProductCard_Qty_W0_Cart({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final Cart cart;

  @override
  _ProductCard_Qty_W0_CartState createState() =>
      _ProductCard_Qty_W0_CartState();
}

class _ProductCard_Qty_W0_CartState extends State<ProductCard_Qty_W0_Cart> {
  int quantity = 0;

  void add() {
    setState(() {
      int ab = widget.cart.numOfItem;
      quantity++;
    });
  }

  void minus() {
    setState(() {
      if (widget.cart.numOfItem + quantity != 1) {
        quantity--;
      } else
        showToast(
            "${widget.cart.product.title} cannot make less than 1 Quantity",
            context: context,
            alignment: Alignment.center,
            position:
                StyledToastPosition(align: Alignment.topCenter, offset: 20.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(1)),
      child: SizedBox(
        width: getProportionateScreenWidth(450),
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //  arguments: ProductDetailsArguments(product: widget.product),
          // ),
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
                  widget.cart.product.title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "\₹ ${widget.cart.product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x ${widget.cart.numOfItem + quantity}",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Qty ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    Spacer(),
                    RoundedIconBtnStyle_2(
                      icon: Icons.remove,
                      showShadow: true,
                      press: () {
                        minus();
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Text(" ${widget.cart.numOfItem + quantity}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    RoundedIconBtnStyle_2(
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
