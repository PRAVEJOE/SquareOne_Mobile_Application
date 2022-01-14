import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/components/default_button.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  // CheckoutCard(double totalPrice,  {Key? key}) : super(key: key);

  const CheckoutCard({
    Key? key,
    this.totalPrice = 0.0,
  }) : super(key: key);
  final double totalPrice;

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

final ItemController itemController = Get.put(ItemController());

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  void initState() {
   // double totalPriceOfCart = itemController.totalPrice() as double;
    print("ssssssssssssssssss");
    print(widget.totalPrice);
    itemController.totalPrice();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("sssssssssssskkkkkkkkkkkk");
    print(widget.totalPrice);
   // double totalPriceOfCart = itemController.totalPrice() as double;
    //print("The number isdddddddddddd $widget.totalPrice");

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  if (itemController.isLoading.value) {
                    return Center(
                        child: SpinKitSpinningLines(
                          color: Colors.black,
                          size: 25.0,
                        ));
                  }
                  else return Text.rich(TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          //text: "($totalPriceOfCart)",
                          //Text ("${score}");
                          text: "${itemController.totalPrice()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ));
                }),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      String? customerID = prefs.getString('customerID');
                      if(customerID==null){
                        Navigator.pushNamed(context, OtpScreen.routeName);
                      }else{
                        Navigator.pushNamed(context, Delivery_Options.routeName);
                      }
                      //  Navigator.pushNamed(context, Delivery_Options.routeName);

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
