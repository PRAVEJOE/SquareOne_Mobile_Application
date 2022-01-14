import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/components/checkConnection.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'featured_product.dart';
import 'home_header.dart';
import 'logo_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LogoHeader(),
            SizedBox(height: getProportionateScreenHeight(20.0)),
            const HomeHeader(),
            const CheckConnection(),
            SizedBox(height: getProportionateScreenWidth(20.0)),
            //DiscountBanner(),
            const SpecialOffers(),//This weeks menu
            SizedBox(height: getProportionateScreenWidth(10.0)),
            const Categories(),
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
