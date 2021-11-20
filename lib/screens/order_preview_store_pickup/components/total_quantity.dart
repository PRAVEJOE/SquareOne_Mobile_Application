import 'package:flutter/material.dart';

import '../../../size_config.dart';

class TotalQuatity extends StatelessWidget {
  const TotalQuatity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Text.rich(
            TextSpan(
              text: "Order Total:\n",
              children: [
                TextSpan(
                  text: "Cess      :₹ 0.00",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "\nInc GST :₹ 1850.00",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
