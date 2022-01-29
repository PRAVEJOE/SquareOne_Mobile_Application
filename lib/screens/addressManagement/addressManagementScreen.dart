import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:square_one_mobile_app/controllers/customerDetailsController.dart';

import 'components/body.dart';

class AddressManagement extends StatefulWidget {
  static String routeName = "/addressManagement";

  @override
  _AddressManagementState createState() => _AddressManagementState();
}

class _AddressManagementState extends State<AddressManagement> {
  final CustomerDetailsController _customerDetailsController =
      Get.put(CustomerDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      //bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Address List",
            style: TextStyle(color: Colors.black),
          ),Obx(() {
            if(customerDetailController.isLoading.value){
              return const Center(
                  child: SpinKitWave(
                    color: Colors.black,
                    size: 10.0,
                  ));
            }else
          return Text(
            "${_customerDetailsController.address.length} Address",
            style: Theme.of(context).textTheme.caption,
          );})
        ],
      ),
    );
  }
}
