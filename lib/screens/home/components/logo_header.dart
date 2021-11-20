import 'package:flutter/material.dart';

import '../../../size_config.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/Sq1Logo.png',
                    width: 220, height: 80))
          ],
        ),
      ),
    );
  }
}
