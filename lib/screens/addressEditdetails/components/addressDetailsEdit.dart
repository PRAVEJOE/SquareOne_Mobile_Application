import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/components/custom_surfix_icon.dart';
import 'package:square_one_mobile_app/components/default_button.dart';
import 'package:square_one_mobile_app/components/form_error.dart';
import 'package:square_one_mobile_app/model/RequestUpdateAddress.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AddressDetailsEdit extends StatefulWidget {
  const AddressDetailsEdit({
    Key? key,
    required this.address,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Address address;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<AddressDetailsEdit> createState() => _AddressDetailsEditState();
}

class _AddressDetailsEditState extends State<AddressDetailsEdit> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? altPhoneNumber;
  String? address;

  String? pincode;
  String? houseNumber;
  String? landMark;
  String? addressType;
  String? region;
  String? kilometer;

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
          buildPhoneNumberFormFields(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAltPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPincodeFormFields(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHouseNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRegionFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildKMFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Update",
            press: () async {
              if (_formKey.currentState!.validate()) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                print(firstName);
                final requestParamUpdateAddress = RequestUpdatedAddress(
                  version: 38,
                  address: [
                    AddressSendParams(
                        addressId: (widget.address.addressId.isEmpty)
                            ? "0"
                            : widget.address.addressId,
                        customerId: prefs.getString("customerID").toString(),
                        fullName: firstName.toString(),
                        address: address.toString(),
                        contactNumber: phoneNumber.toString(),
                        alternativeNumber: altPhoneNumber.toString(),
                        pincode: pincode.toString(),
                        houseNumber: houseNumber.toString(),
                        landMark: landMark.toString(),
                        addressType: "HOME",
                        region: region.toString(),
                        hDfromShop: "1",
                        isGiftaddress: "0",
                        kilometer: "4")
                  ],
                );
                final result = await RemoteServices.getAddressUpdate(
                    requestParamUpdateAddress);
                print(result.success.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormFields() {
    return TextFormField(
      initialValue: widget.address.contactNumber,
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
        phoneNumber = value;
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
      initialValue: widget.address.alternativeNumber,
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

  TextFormField buildPincodeFormFields() {
    return TextFormField(
      initialValue: widget.address.pincode,
      keyboardType: TextInputType.phone,
      enabled: false,
      onSaved: (newValue) => pincode = newValue,
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
        pincode = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: "PinCode",
        hintText: "",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: widget.address.fullName,
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
        firstName = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your Full Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildHouseNumberFormField() {
    return TextFormField(
      initialValue: widget.address.houseNumber,
      onSaved: (newValue) => houseNumber = newValue,
      onChanged: (value) {
        houseNumber = value;
      },
      validator: (value) {
        houseNumber = value;
      },
      decoration: InputDecoration(
        labelText: "House Number",
        hintText: "Enter your House Number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildRegionFormField() {
    return TextFormField(
      initialValue: widget.address.region,
      onSaved: (newValue) => region = newValue,
      onChanged: (value) {
        region = value;
      },
      validator: (value) {
        region = value;
      },
      decoration: InputDecoration(
        labelText: "Region",
        hintText: "Enter your Region",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLandMarkFormField() {
    return TextFormField(
      initialValue:
          (widget.address.landMark.isEmpty) ? "" : widget.address.landMark,
      onSaved: (newValue) => landMark = newValue,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        landMark = value;
      },
      validator: (value) {
        landMark = value;
      },
      decoration: InputDecoration(
        labelText: "Land Mark",
        hintText: "Enter your Land Mark",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildKMFormField() {
    return TextFormField(
      initialValue:
          (widget.address.kilometer.isEmpty) ? "" : widget.address.kilometer,
      onSaved: (newValue) => kilometer = newValue,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        kilometer = value;
      },
      validator: (value) {
        kilometer = value;
      },
      decoration: InputDecoration(
        labelText: "Kilometer",
        hintText: "Auto Generate",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      initialValue: widget.address.address,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
          address = value;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        address = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Address",
        hintText: "Enter your Address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
