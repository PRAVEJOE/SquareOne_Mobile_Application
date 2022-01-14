
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/constants.dart';
import 'package:square_one_mobile_app/size_config.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.image,required this.buttonText,
    required this.press,
  }) : super(key: key);

  final String image ,buttonText;
  final press;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: FlatButton(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed:
                  press
                ,
                child: Text(
                  buttonText.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
