import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/components/custom_surfix_icon.dart';
import 'package:square_one_mobile_app/components/default_button.dart';
import 'package:square_one_mobile_app/components/form_error.dart';
import 'package:square_one_mobile_app/model/RequestUpdateProfile.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/screens/profile/profile_screen.dart';
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
          buildPhoneNumberFormFields(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAltPhoneNumberFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                print(firstName);
                final requestParamProfile = RequestUpdateProfile(
                    isNewCustomer: true,
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
                  if(result.success == true && prefs.getString("loginActivation")!="activated") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Delivery_Options()),
                    );
                  }
                else if(result.success == true && prefs.getString("loginActivation")=="activated") {
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(builder: (builder) => ProfileScreen()),
                   );
                 }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormFields() {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.phone,
      enabled: false,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAltPhoneNumberFormField() {
    return TextFormField(
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
          return "";
        }
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
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
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
          return "";
        }
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
