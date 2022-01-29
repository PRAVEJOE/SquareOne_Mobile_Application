import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/components/custom_surfix_icon.dart';
import 'package:square_one_mobile_app/components/default_button.dart';
import 'package:square_one_mobile_app/components/form_error.dart';
import 'package:square_one_mobile_app/controllers/customerDetailsController.dart';
import 'package:square_one_mobile_app/model/RequestUpdateProfile.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {


  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? altPhoneNumber;
  bool isLoading=false;
  String buttonText="Click to Update";

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  final TextEditingController _controller = TextEditingController();
  void buildvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNo = prefs.getString('phoneNo');
    print("dd" + phoneNo.toString());
    phoneNumber =
        phoneNo.toString(); // still don't know what this is, a boolean?
    setState(() {
      _controller.text = prefs.getString('phoneNo')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildvalue();
  }
  final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAltPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormFields(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          (isLoading)
              ? LoadingAnimationWidget.staggeredDotWave(
            color: Colors.black,
            size: 40,
          ) :
          DefaultButton(
            text: buttonText,
            press: () async {
              try {
                setState(() {
                  isLoading=true;
                });

                if (_formKey.currentState!.validate()) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  print(firstName);
                  final requestParamProfile = RequestUpdateProfile(
                      customerID: prefs.getString("customerID").toString().toUpperCase(),
                      isNewCustomer: false,
                      firstName: firstName.toString(),
                      lastName: lastName.toString(),
                      phone: phoneNumber.toString(),
                      altPhone: altPhoneNumber.toString());
                  final result =
                  await RemoteServices.getCustomerUpdate(requestParamProfile);
                  print(result.success.toString());
                  if (result.success == true) {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    await prefs.setString(
                        'firstName', firstName.toString().toUpperCase());
                    await prefs.setString(
                        'lastName', lastName.toString().toUpperCase());
                    await prefs.setString('customerID',
                        result.resultVal.customerId.toString().toUpperCase());
                    await prefs.setString(
                        'phoneNo', phoneNumber.toString().toUpperCase());
                    MotionToast.success(
                      title: Text(
                        'Sucess',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      description: Text(
                        ' Profile Sucessfully Updated',
                        style: TextStyle(fontSize: 12),
                      ),
                      animationType: ANIMATION.fromLeft,
                      position: MOTION_TOAST_POSITION.top,
                      width: 300,
                    ).show(context);
                   // Navigator.pop(context);
                  }else{
                    MotionToast.warning(
                      title: Text(
                        'Failed',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      description: Text(
                        ' Not Updated..Try Again',
                        style: TextStyle(fontSize: 12),
                      ),
                      layoutOrientation: ORIENTATION.rtl,
                      animationType: ANIMATION.fromRight,
                      width: 300,
                    ).show(context);
                  }
                }
              }finally{
                setState(() {
                  isLoading=false;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormFields() {
    final CustomerDetailsController customerDetailController = Get.put(CustomerDetailsController());
    return TextFormField(
      controller: _controller,
      enabled: false,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
          phoneNumber = value;
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          phoneNumber = value;
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAltPhoneNumberFormField() {
    return TextFormField(
      initialValue: customerDetailController.customerDetail[0].phone2
          .toString()
          .toUpperCase(),
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => altPhoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
          altPhoneNumber = value;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          altPhoneNumber = value;
          return "";
        }
        altPhoneNumber = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: "Alternative Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue: customerDetailController.customerDetail[0].lastName
          .toString()
          .toUpperCase(),
      onSaved: (newValue) => lastName = newValue,
      validator: (value){
        lastName = value;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: customerDetailController.customerDetail[0].firstName
          .toString()
          .toUpperCase(),
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
          firstName = value;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          firstName = value;
          return "";
        }
        firstName = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
