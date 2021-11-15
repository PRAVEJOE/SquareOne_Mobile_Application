import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:square_one_mobile_app/screens/prebook/components/cateogry_selector_2.dart';
import 'package:square_one_mobile_app/screens/prebook/prebook_screen.dart';

import '../../../size_config.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var stringtry;

  @override
  Widget build(BuildContext context) {


    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/birthday-cake.svg", "text": "Cakes", "id": "1"},
      {"icon": "assets/icons/nachos.svg", "text": "Snacks", "id": "2"},
      {"icon": "assets/icons/take-away.svg", "text": "Take Away", "id": 3},
      {"icon": "assets/icons/food.svg", "text": "Packed Items"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {

              Navigator.pushNamed(context, Prebook.routeName,arguments: {'SelectedIndex': index+1});


            },
          ),
        ),
      ),
    );
  }

  void passIdToBodyPrebook(BuildContext context) async {


    var result = await Navigator.pushNamed(context, '/prebook');
    setState(() {
      result= stringtry;
      print("stringgggtry"+ stringtry);
    });

  }

}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
