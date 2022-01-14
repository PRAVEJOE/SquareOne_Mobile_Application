import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:square_one_mobile_app/components/product_card_qty_without_add_to_cart.dart';
import 'package:square_one_mobile_app/models/Cart.dart';

class PreBookProducts extends StatefulWidget {
  const PreBookProducts({Key? key}) : super(key: key);

  @override
  _PreBookProductsState createState() => _PreBookProductsState();
}

class _PreBookProductsState extends State<PreBookProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ListView.builder(
            itemCount: demoCarts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                  child: ProductCardQtyWithOutAddToCart(cart: demoCarts[index])),
            ),
          ),
        )),
      ],
    );
  }
}
