import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Order 1"),
          Text("FRI,29 OCT 12:00 PM"),
          IconBtnWithCounter(
            svgSrc: "assets/icons/delete.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}