import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/routes.dart';
import 'package:square_one_mobile_app/screens/home/home_screen.dart';
import 'package:square_one_mobile_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute:HomeScreen.routeName,
      routes: routes,
    );
  }
}
