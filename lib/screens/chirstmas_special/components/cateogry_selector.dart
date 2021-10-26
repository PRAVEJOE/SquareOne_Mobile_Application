import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/prebook/components/section_title.dart';

import '../../../size_config.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int cupertinoTabBarVIIIValue = 0;
  int cupertinoTabBarVIIIValueGetter() => cupertinoTabBarVIIIValue;
  @override
  Widget build(BuildContext context) {
    return
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),getProportionateScreenWidth(4),getProportionateScreenWidth(20),getProportionateScreenWidth(20)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(1),
            vertical: getProportionateScreenWidth(2),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F5),
            borderRadius: BorderRadius.circular(15),
          ),
      child:
        CupertinoTabBar.CupertinoTabBar(
          const Color(0xFFF1F1F5),
          const Color(0xff000000),
          [
            Text(
              "All",
              style: TextStyle(
                color: cupertinoTabBarVIIIValue == 0 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Cake",
              style: TextStyle(
                color: cupertinoTabBarVIIIValue == 1 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Snacks",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 2 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "TakeAway",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 3 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Condiments",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 4 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Specials",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 5 ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          cupertinoTabBarVIIIValueGetter,
              (int index) {
            setState(() {
              cupertinoTabBarVIIIValue = index;
            });
          },
          useShadow: false,
          useSeparators: false,
          allowScrollable: true,
          fittedWhenScrollable: true,
          animateWhenScrollable: true,
        ),
    );
  }
}

