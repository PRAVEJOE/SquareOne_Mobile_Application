import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Slot_Chooser extends StatelessWidget {
  const Slot_Chooser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              "Select a Pick up Slot",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        CustomRadioButton(
          elevation: 0,
          selectedBorderColor: Colors.black,
          unSelectedBorderColor: Colors.black12,
          buttonTextStyle: ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: Colors.black,
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
          autoWidth: true,
          enableButtonWrap: true,
          wrapAlignment: WrapAlignment.center,
          unSelectedColor: Theme.of(context).canvasColor,
          buttonLables: [
            "10:00 AM",
            "12:00 PM",
            "02:00 PM",
          ],
          buttonValues: [
            "10:00 AM",
            "12:00 PM",
            "02:00 PM",
          ],
          radioButtonValue: (value) {
            print(value);
          },
          horizontal: false,
          width: 120,
          // hight: 50,
          selectedColor: Colors.black,
          padding: 5,
          enableShape: true,
        ),
      ],
    );
  }
}
