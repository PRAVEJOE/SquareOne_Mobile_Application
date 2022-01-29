import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final ItemController _controllers = Get.put(ItemController());
  final TreeController productController=Get.put(TreeController());
  _getRequests()async{
    productController.updateProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Obx((){
            if(_controllers.isLoading.value){
              return const Center(
                  child: SpinKitWave(
                    color: Colors.black,
                    size: 10.0,
                  ));
            }else{
           return IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              numOfItem: _controllers.cart.length,
              press: () =>
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new CartScreen()),)
                      .then((val)=>val?_getRequests():null),

           );
            }
          }),

          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItem: 2,
            press: () {},
          ),
        ],
      ),
    );
  }
}
