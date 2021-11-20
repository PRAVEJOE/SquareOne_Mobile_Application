import 'package:flutter/material.dart';

class HomeDeliveryPic extends StatelessWidget {
  const HomeDeliveryPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 280,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          new Image.asset(
            'assets/images/home-delivery.gif',
          ),
        ],
      ),
    );
  }
}
