import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpLoginSignUp extends StatelessWidget {
  static String routeName = "/otpLoginSignUp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
