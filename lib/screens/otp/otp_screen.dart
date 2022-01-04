import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:square_one_mobile_app/constants.dart';
import 'package:square_one_mobile_app/screens/home/components/logo_header.dart';
import 'package:square_one_mobile_app/services/Auth_Service.dart';

import '../../constants.dart';
import '../../constants.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";

  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  bool _isLoading = true;
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: kTextColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sign-In",
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoHeader(),
              SizedBox(
                height: 60,
              ),
              textField(),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 16, color: kTextColor),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              otpField(),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Send OTP again in ",
                    style: TextStyle(fontSize: 16, color: kTextColor),
                  ),
                  TextSpan(
                    text: "00:$start",
                    style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                  ),
                  TextSpan(
                    text: " sec ",
                    style: TextStyle(fontSize: 16, color: kTextColor),
                  ),
                ],
              )),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  authClass.signInwithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Lets Go",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          _isLoading = false;
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        child: PinPut(
          eachFieldMargin: EdgeInsets.all(0),
          eachFieldWidth: 45.0,
          eachFieldHeight: 55.0,
          fieldsCount: 6,
          onSubmit: (String pin) => _showSnackBar(pin, context),
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          onChanged: (String pin) {
            smsCode = pin;
            //handle validation or checks here
          },
          textStyle:
              const TextStyle(color: kPrimaryColor, fontSize: 20.0, height: 1),
          submittedFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(20.0),
          ),
          selectedFieldDecoration: _pinPutDecoration,
          followingFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: kTextColor.withOpacity(.5),
            ),
          ),
        ));
  }

  Widget textField() {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        decoration: BoxDecoration(
          // color: Color(0xff1d1d1d),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          enabled: !wait,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          controller: phoneController,
          style: TextStyle(color: kTextColor, fontSize: 19),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff7b733))),
            hintText: "Enter your phone Number",
            hintStyle: TextStyle(color: kTextColor, fontSize: 17),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: -11),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IN',
                favorite: ['+39','FR'],
                showDropDownButton: true,
                showFlag: false,
                showFlagDialog: true,
                // optional. Shows only country name and flag
                showCountryOnly: false,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left

              ),
            ),

            suffixIcon: InkWell(
              onTap: wait
                  ? null
                  : () async {
                      if (phoneController.text.length >= 10) {
                        setState(() {
                          start = 30;
                          wait = true;
                          buttonName = "Resend";
                        });
                        await authClass.verifyPhoneNumber(
                            "+91 ${phoneController.text}", context, setData);
                      } else {
                        showToast(
                            "${phoneController.text} is invalid phone number,Please enter correct phone number",
                            context: context,
                            alignment: Alignment.center,
                            position: StyledToastPosition(
                                align: Alignment.topCenter, offset: 20.0));
                      }
                    },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                child: (wait)
                    ? LoadingAnimationWidget.staggeredDotWave(
                            color: Colors.black,
                            size: 35,
                        )
                    : Text(
                        buttonName,
                        style: TextStyle(
                          color: wait ? Colors.white : Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ));
  }

  void setData(String verificationId) {
    if(verificationId=="false"){
      wait=false;
      setState(() {
        wait=false;
      });
    }else{
      setState(() {
        verificationIdFinal = verificationId;
      });
      startTimer();
    }
    }

}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    content: Container(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
    ),
    backgroundColor: Colors.black,
  );
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
