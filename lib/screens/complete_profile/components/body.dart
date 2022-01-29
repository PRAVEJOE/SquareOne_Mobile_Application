import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:square_one_mobile_app/constants.dart';
import 'package:square_one_mobile_app/controllers/customerDetailsController.dart';
import 'package:square_one_mobile_app/size_config.dart';

import '../../../errorPageCommon.dart';
import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => setState(() {
      final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
      customerDetailController.getCustomerDetail();
    }));
  }
  @override
  Widget build(BuildContext context) {
    final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
    return SafeArea(
          child: Obx(() {
            if (customerDetailController.isLoading.value) {
              return const Center(
                  child: SpinKitWave(
                    color: Colors.black,
                    size: 50.0,
                  ));
            } else if (customerDetailController.customerDetail.length > 0) {
             return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.03),
                        Text("Update Profile", style: headingStyle),
                        Text(
                          "Update your details or continue  \nwith social media",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.06),
                        CompleteProfileForm(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        Text(
                          "By continuing your confirm that you agree \nwith our Term and Condition",
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return ErrorPage(
                image: "assets/images/3_Something Went Wrong.png",
                press: () {
                  final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
                  customerDetailController.getCustomerDetail();
                },
                buttonText: 'Refresh',
              );
            }
          }
          ));

  } }


