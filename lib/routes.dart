import 'package:flutter/widgets.dart';
import 'package:square_one_mobile_app/screens/cart/cart_screen.dart';
import 'package:square_one_mobile_app/screens/chirstmas_special/christmas_screen.dart';
import 'package:square_one_mobile_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:square_one_mobile_app/screens/delivery_options/delivery_screen.dart';
import 'package:square_one_mobile_app/screens/details/details_screen.dart';
import 'package:square_one_mobile_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:square_one_mobile_app/screens/home/home_screen.dart';
import 'package:square_one_mobile_app/screens/login_success/login_success_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_home_delivery/order_preview_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_home_delivery_multi/order_preview_screen.dart';
import 'package:square_one_mobile_app/screens/order_preview_store_pickup/order_preview_screen.dart';
import 'package:square_one_mobile_app/screens/otp/otp_screen.dart';
import 'package:square_one_mobile_app/screens/prebook/prebook_screen.dart';
import 'package:square_one_mobile_app/screens/profile/profile_screen.dart';
import 'package:square_one_mobile_app/screens/sign_in/sign_in_screen.dart';
import 'package:square_one_mobile_app/screens/splash/splash_screen.dart';
import 'package:square_one_mobile_app/screens/todaysmenu/todaysmenu_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Prebook.routeName: (context) => Prebook(),
  TodaysMenu.routeName: (context) => TodaysMenu(),
  ChristmasSpecial.routeName: (context) => ChristmasSpecial(),
  OrderPreview.routeName: (context) => OrderPreview(),
  OrderPreviewHomeDelivery.routeName: (context) => OrderPreviewHomeDelivery(),
  Delivery_Options.routeName: (context) => Delivery_Options(),
  OrderPreviewHomeDeliveryMulti.routeName: (context) =>
      OrderPreviewHomeDeliveryMulti()
};
