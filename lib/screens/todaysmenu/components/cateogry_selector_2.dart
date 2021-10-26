import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/screens/prebook/components/section_title.dart';

import '../../../size_config.dart';

class CategorySelector_2 extends StatefulWidget {
  const CategorySelector_2({Key? key}) : super(key: key);

  @override
  _CategorySelector_2State createState() => _CategorySelector_2State();
}

class _CategorySelector_2State extends State<CategorySelector_2> {
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
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
          ),
      child:
        CupertinoTabBar.CupertinoTabBar(
          const Color(0xFFFFFFFF),
          const Color(0xFFFFFFFF),
          [
            Text(
              "All",
              style: TextStyle(
                color: cupertinoTabBarVIIIValue == 0 ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Cake",
              style: TextStyle(
                color: cupertinoTabBarVIIIValue == 1 ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Snacks",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 2 ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "TakeAway",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 3 ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Condiments",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 4 ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Specials",
              style:  TextStyle(
                color: cupertinoTabBarVIIIValue == 5 ? Colors.black : Colors.grey,
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

