import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:square_one_mobile_app/controllers/customerDetailsController.dart';

import '../../../errorPageCommon.dart';
import '../../../size_config.dart';
import 'addressManagementCard.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

final CustomerDetailsController _customerDetailsController =
    Get.put(CustomerDetailsController());

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
    customerDetailController.getCustomerDetail();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(() {
        if (_customerDetailsController.isLoading.value) {
          return const Center(
              child: SpinKitWave(
                color: Colors.black,
                size: 50.0,
              ));
        } else if(_customerDetailsController.address.length> 0){
          return ListView.builder(
            itemCount: _customerDetailsController.address.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:  Dismissible(
                    key: Key(
                        _customerDetailsController.address[index].addressId
                            .toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        // itemController.removeProductToCart(index);
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: AddressManagementCard(address: _customerDetailsController.address[index],
                    ),
                  ),
                ),
          );
        }else{
          return ErrorPage(
            image: "assets/images/3_Something Went Wrong.png",
            press: () {
              final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
              customerDetailController.getCustomerDetail();
            },
            buttonText: 'Refresh',
          );
        }
      },
      )
    );
  }
}
