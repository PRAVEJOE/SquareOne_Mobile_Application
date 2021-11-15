import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/components/coustom_bottom_nav_bar.dart';
import 'package:square_one_mobile_app/enums.dart';
import 'package:square_one_mobile_app/screens/home/components/categories.dart';

import '../../size_config.dart';
import 'components/body.dart';

class Prebook extends StatelessWidget {

  static String routeName = "/prebook";
  

  @override
  Widget build(BuildContext context) {
    int SelectedIndex=0;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    SelectedIndex = arg['SelectedIndex'];
    SizeConfig().init(context);
    return Scaffold(
      body: Body(SelectedIndex),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
