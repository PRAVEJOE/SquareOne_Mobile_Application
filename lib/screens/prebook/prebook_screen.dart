import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/components/coustom_bottom_nav_bar.dart';
import 'package:square_one_mobile_app/enums.dart';

import '../../size_config.dart';
import 'components/body.dart';

class Prebook extends StatelessWidget {
  static String routeName = "/prebook";

  const Prebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    selectedIndex = arg['SelectedIndex'];
    SizeConfig().init(context);
    return Scaffold(
      body: Body(selectedIndex),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
