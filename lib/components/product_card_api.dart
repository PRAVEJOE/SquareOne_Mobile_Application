import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/product.dart';
import 'package:square_one_mobile_app/models/Product.dart';
import 'package:square_one_mobile_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';
import 'default_button-small.dart';

class ProductCardAPI extends StatefulWidget {
  final Datum treeItemItem;
  const ProductCardAPI(this.treeItemItem);
  @override
  _ProductCardAPIState createState() => _ProductCardAPIState();
}

class _ProductCardAPIState extends State<ProductCardAPI> {
  int quantity = 0;

  void add() {
    setState(() {
      quantity++;
    });
  }

  void minus() {
    setState(() {
      if (quantity != 0) quantity--;
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
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\₹${widget.treeItemItem.unitPrice}",
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
                    Text("$quantity ",
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
                SizedBox(height: getProportionateScreenWidth(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButtonSmall(
                      text: "Add To Cart",
                      press: () {},
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
