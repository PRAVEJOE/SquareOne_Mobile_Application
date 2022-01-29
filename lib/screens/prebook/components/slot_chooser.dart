import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

import '../../../size_config.dart';

class SlotChooser extends StatefulWidget {
  const SlotChooser({Key? key}) : super(key: key);

  @override
  _SlotChooserState createState() => _SlotChooserState();
}

class _SlotChooserState extends State<SlotChooser> {
  @override
  Widget build(BuildContext context) {
    final TreeController productController = Get.put(TreeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: const Text(
              "Select a Pick up Slot",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        Obx(() {
          if (productController.slotIsLoading.value) {
            return Center(
                child: SpinKitWave(
              color: Colors.black,
              size: 30.0,
            ));
          } else {
            return CustomRadioButton(
              elevation: 0,
              selectedBorderColor: Colors.black,
              unSelectedBorderColor: Colors.black12,
              buttonTextStyle: const ButtonTextStyle(
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
              defaultSelected: productController.dateSlot[0],
              buttonLables: productController.dateSlot,
              buttonValues: productController.dateSlot,
              radioButtonValue: (value) {
                final TreeController _controllers = Get.put(TreeController());
                _controllers.listPrebookItemTime(value.toString());


              },
              horizontal: false,
              width: 120,
              // height: 50,
              selectedColor: Colors.black,
              padding: 5,
              enableShape: true,
            );
          }
        })
      ],
    );
  }
}
