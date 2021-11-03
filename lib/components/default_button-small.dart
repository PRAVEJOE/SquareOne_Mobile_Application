import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButtonSmall extends StatelessWidget {
  const DefaultButtonSmall({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenHeight(120),
      height: getProportionateScreenHeight(45),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
