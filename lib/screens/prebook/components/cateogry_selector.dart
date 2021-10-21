import 'package:flutter/material.dart';

import '../../../categoryTitle.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Category_Selector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Categories", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              CategoryTitle(title: "All", active: true),
              CategoryTitle(title: "Cakes"),
              CategoryTitle(title: "Snacks"),
              CategoryTitle(title: "TakeAway"),
              CategoryTitle(title: "Condiments"),
              CategoryTitle(title: "Specials")
            ],
          ),
        ),
      ],
    );
  }
}
