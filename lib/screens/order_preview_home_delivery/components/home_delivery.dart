import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:square_one_mobile_app/screens/delivery_options/components/delivery_menu.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_store_pickup/order_preview_screen.dart';

import '../../../size_config.dart';
import 'back.dart';
import 'header_size.dart';

class HomeDelivery extends StatefulWidget {
  const HomeDelivery({Key? key}) : super(key: key);

  @override
  _HomeDeliveryState createState() => _HomeDeliveryState();
}

class _HomeDeliveryState extends State<HomeDelivery> {
  int cupertinoTabBarVIIIValue = 5;

  int cupertinoTabBarVIIIValueGetter() => cupertinoTabBarVIIIValue;

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Container(
        child:  Back(
          text: "More Options",
          icon: "assets/icons/arrow-back-ios.svg",
          press: () => {
          Navigator.pop(context)
          },
        ),
    ),
    ]);
  }
}
