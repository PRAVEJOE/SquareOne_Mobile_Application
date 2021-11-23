import 'package:flutter/material.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/screens/cart/components/check_out_card.dart';

enum HomeState { normal, cart }

class ItemController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<Datum> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(Datum product) {
    // for (Datum item in cart) {
    //   if (item.productName! == product.productName) {
    //     item.increment();
    //     notifyListeners();
    //     return;
    //   }
    // }
    cart.add(product);
    notifyListeners();
    print(cart.length);
  }





  double totalPrice() {
    // add your price calculation logic
    double total = 0;
    cart.forEach((item) {
      total += double.parse(item.unitPrice) * (item.quantity).toDouble();
    });
    print(total);

    return total;
  }


// int totalCartItems() => cart.fold(
//     0, (previousValue, element) => previousValue + element.quantity);
}
