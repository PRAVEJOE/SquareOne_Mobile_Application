import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn.dart';

import '../../../size_config.dart';

class Quantitycounter extends StatefulWidget {
  const Quantitycounter({Key? key}) : super(key: key);

  @override
  _QuantitycounterState createState() => _QuantitycounterState();
}

class _QuantitycounterState extends State<Quantitycounter> {
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
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text("Quantity ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              minus();
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text("$quantity ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
              icon: Icons.add,
              showShadow: true,
              press: () {
                add();
              }),
        ],
      ),
    );
  }
}
