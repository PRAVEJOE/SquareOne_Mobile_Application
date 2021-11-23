import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

import '../../../size_config.dart';

class Slot_Chooser extends StatelessWidget {
  const Slot_Chooser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TreeController _controllers =
    Get.put(TreeController());
    _controllers.listprebookItemTime("10:00 AM");
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
          defaultSelected: "10:00 AM",
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
            final TreeController _controllers =
            Get.put(TreeController());
            _controllers.listprebookItemTime(value.toString());
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
