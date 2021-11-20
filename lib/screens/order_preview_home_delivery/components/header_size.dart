import 'package:flutter/material.dart';

import '../../../size_config.dart';

class HeaderSize extends StatelessWidget {
  const HeaderSize({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
