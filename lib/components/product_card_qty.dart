import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/models/Product.dart';
import 'package:square_one_mobile_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';
import 'default_button-small.dart';

class ProductCard_Qty extends StatefulWidget {
  const ProductCard_Qty({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);
  final double width, aspectRetio;
  final Product product;

  @override
  _ProductCard_QtyState createState() => _ProductCard_QtyState();
}

class _ProductCard_QtyState extends State<ProductCard_Qty> {
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
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: widget.product),
          ),
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
                    child: Hero(
                      tag: widget.product.id.toString(),
                      child: Image.asset(widget.product.images[0]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.product.title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\₹${widget.product.price}",
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
                        decoration: BoxDecoration(
                          color: widget.product.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: widget.product.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
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
      ),
    );
  }
}
