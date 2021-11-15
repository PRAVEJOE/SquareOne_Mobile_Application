import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'featured_product.dart';
import 'home_header.dart';
import 'logo_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            LogoHeader(),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(20.0)),
            //DiscountBanner(),
            SpecialOffers(),//This weeks menu
            SizedBox(height: getProportionateScreenWidth(10.0)),
            Categories(),
            // SizedBox(height: getProportionateScreenWidth(30.0)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30.0)),
            FeaturedProducts(),
            SizedBox(height: getProportionateScreenWidth(30.0)),
          ],
        ),
      ),
    );
  }
}
