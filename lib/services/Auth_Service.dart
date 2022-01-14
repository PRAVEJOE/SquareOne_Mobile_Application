
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final storage = new FlutterSecureStorage();
  Future<void> signOut({required BuildContext context}) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
  String phoneNo="";
  Future<void> verifyPhoneNumber(
       phoneNumber, BuildContext context, Function setData) async {
    phoneNo=phoneNumber;
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");

    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context,exception.toString());
      setData("false");
    };
    PhoneCodeSent codeSent =
        (String verificationID, [ int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    } as PhoneCodeSent;

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
      setData("false");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
     // setData("false");
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      String number = phoneNo;
      if(number.contains("+91")){
         number = phoneNo.substring(4);
      }else if(number.contains("+")&&!number.contains("+91")){
        number = phoneNo.substring(2);
      }

      final result = await RemoteServices.getCustomerDetails(number);
      if(result!=null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (builder) => Delivery_Options()),);
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('firstName', result.data[0].firstName.toString().toUpperCase());
      await prefs.setString('lastName', result.data[0].lastName.toString().toUpperCase());
      await prefs.setString('customerID', result.data[0].customerId.toString().toUpperCase());
      await prefs.setString('phoneNo', result.data[0].phone.toString().toUpperCase());

      showSnackBar(context,"Hi, "+ result.data[0].firstName.toString().toUpperCase()+ " " + result.data[0].lastName.toString().toUpperCase()+", Welcome Back");

    } catch (e) {
      showSnackBar(context, e.toString());

    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}