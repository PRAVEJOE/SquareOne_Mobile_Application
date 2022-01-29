import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/controllers/customerDetailsController.dart';
import 'package:square_one_mobile_app/screens/addressManagement/addressManagementScreen.dart';
import 'package:square_one_mobile_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:square_one_mobile_app/screens/otp/otp_screen.dart';
import 'package:square_one_mobile_app/screens/profile/components/profile_menu.dart';
import 'package:square_one_mobile_app/screens/profile/components/profile_pic.dart';
import 'package:square_one_mobile_app/screens/profile/profile_screen.dart';

import '../../../errorPageCommon.dart';

String validation = '';
String customerId = "";

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    _savePomo();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => setState(() {
          if((customerId != null || customerId != "" || customerId != "null")&&validation=="activated") {
            print("dd");
            final CustomerDetailsController customerDetailController = Get.put(
                CustomerDetailsController());
            customerDetailController.getCustomerDetail();
          }
    }));

    super.initState();
  }
  _savePomo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    customerId=(prefs.getString("customerID") ?? '');
    validation=(prefs.getString("loginActivation") ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());

    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child:Obx(() {

          if(customerDetailController.isLoading.value){
            return const Center(
                child: SpinKitWave(
                  color: Colors.black,
                  size: 50.0,
                ));
          }
      else if (customerId == null || customerId == "" || customerId == "null") {
        return
          Column(children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "Login",
              icon: "assets/icons/User Icon.svg",
              press: ()
              async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if(customerId != null || customerId != "" || customerId != "null"){
                  await prefs.setString('loginActivation', "activated");
                }else{
                  await prefs.setString('loginActivation', "");
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(),
                  ),
                );
              },
            ),
          ]);
      } else if (customerId != null || customerId != "" || customerId != "null") {
        return Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: ()
              async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('loginActivation', "");
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Address Management",
              icon: "assets/icons/Bell.svg",
              press: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('loginActivation', "");
                Navigator.pushNamed(context, AddressManagement.routeName);
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('firstName',"");
                await prefs.setString('lastName', "");
                await prefs.setString('customerID',"");
                await prefs.setString('phoneNo', "");
                await prefs.setString('loginActivation', "");
                await prefs.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (builder) => ProfileScreen()),);
              },
            ),
          ],
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
    })
           );
        }
  }
