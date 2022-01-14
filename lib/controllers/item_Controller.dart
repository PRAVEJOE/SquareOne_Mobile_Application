import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';

enum HomeState { normal, cart }

class ItemController extends GetxController {
  HomeState homeState = HomeState.normal;
  var isLoading = true.obs;
  List<Datum> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
  }

  void addProductToCart(Datum product) {
    cart.add(product);
    if (kDebugMode) {
      print(cart.length);
    }
  }

  void removeProductToCart(index) {
    try {
      isLoading(true);
      cart.removeAt(index);
      if (kDebugMode) {
        print(cart.length);
      }
    } finally {
      isLoading(false);
    }
  }

  double totalPrice() {
    // add your price calculation logic
    try {
      isLoading(true);
      double total = 0;
      for (var item in cart) {
        total += double.parse(item.unitPrice) * (item.quantity).toDouble();
      }
      if (kDebugMode) {
        print("Total Value in Cart" + total.toString());
      }
      return total;
    } finally {
      isLoading(false);
    }
  }
}
