import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/chirstmas_special/christmas_screen.dart';
import 'package:square_one_mobile_app/screens/prebook/prebook_screen.dart';
import 'package:square_one_mobile_app/screens/todaysmenu/todaysmenu_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/dailymenu.jpg",
                category: "Today's Menu",
                numOfBrands: "View all of today's products available at our shop and get them home delivered in two hours!",
                press: () {
                  Navigator.pushNamed(context, TodaysMenu.routeName);
                },
              ),
              SpecialOfferCard(
              image: "assets/images/takeaway.jpg",
              category: "This Week Menu",
              numOfBrands: "Pre-book from our entire range of homemade treats of the week, and satisfy your cravings for the week!",
              press: () {
                Navigator.pushNamed(context, Prebook.routeName);
              },
            ),
              SpecialOfferCard(
                image: "assets/images/xmas.jpg",
                category: "Christmas Specials",
                numOfBrands: "The fondest memories are made gathered around a table.",
                press: () {
                  Navigator.pushNamed(context, ChristmasSpecial.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/condiments (1).jpg",
                category: "Advanced Order",
                numOfBrands: "Throw a party,celebrate a special occasion, or none at all! Explore and order any time from our entire range of products, especially our specialty birthday cakes.",
                press: () {
                 // Navigator.pushNamed(context, Prebook.routeName);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
