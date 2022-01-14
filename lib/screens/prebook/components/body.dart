import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:square_one_mobile_app/components/checkConnection.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/screens/prebook/components/slot_chooser.dart';

import '../../../errorPageCommon.dart';
import '../../../size_config.dart';
import 'cateogry_selector_2.dart';
import 'date_picker.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  late int selectedIndex = 0;

  Body(this.selectedIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TreeController productController = Get.put(TreeController());
    productController.slotDate();
    return SafeArea(child: Obx(() {
      if (productController.slotDateIsLoading.value) {
        return const Center(
            child: SpinKitWave(
          color: Colors.black,
          size: 50.0,
        ));
      } else if (productController.prebookDateSlotList.length > 0) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenHeight(20.0)),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(2)),
                  child: Text(
                    "This Week's Menu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: getProportionateScreenHeight(20.0)),
              CheckConnection(),
              DateSelector(),

              SlotChooser(),
              SizedBox(height: getProportionateScreenHeight(0.0)),
              CategorySelector_2(selectedIndex),
              // PreBookProducts(),
              SizedBox(height: getProportionateScreenWidth(30.0)),
            ],
          ),
        );
      } else {
        return ErrorPage(
          image: "assets/images/3_Something Went Wrong.png",
          press: () {
            final TreeController productController = Get.put(TreeController());
            productController.slotDate();
          },
          buttonText: 'Refresh',
        );
      }
    }));
  }
}
