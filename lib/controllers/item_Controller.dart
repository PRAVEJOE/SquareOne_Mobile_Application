import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/cartModel.dart';

class ItemController extends GetxController {
  var isLoading = false.obs;
  List cartProduct = <CartProduct>[].obs;
  List cartDate = <Cart>[].obs;
  List cart = <CartAddedItem>[].obs;
  double total = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addProductToCart(PrebookItem product) {
    try {
      isLoading(true);

      if (itemController.cart.length.toString() == "0" && product.uniqueID == "") {
        final requestParamPrebook = Cart(deliveryDate: product.date, deliverySlot: product.slot, cartAddedItems: [CartAddedItem(itemId: product.itemId,slot: product.slot,date: product.date, productName: product.productName, displayName: product.displayName, onlineCategoryName: product.onlineCategoryName, unitPrice: product.unitPrice, itemWtForHd: product.itemWtForHd,quantity: product.quantity,uniqueID: product.uniqueID , hditemWtUnit: product.hditemWtUnit, maximumPossible: product.maximumPossible, availabilitytime: product.availabilitytime, availabilityperiod: product.availabilityperiod)]);
        cartProduct.add(CartProduct(Cartitems: [requestParamPrebook]));
        cartDate.add(requestParamPrebook);
        cart.add(CartAddedItem(itemId: product.itemId,slot: product.slot,date: product.date, productName: product.productName, displayName: product.displayName, onlineCategoryName: product.onlineCategoryName, unitPrice: product.unitPrice, itemWtForHd: product.itemWtForHd,quantity: product.quantity,uniqueID: product.uniqueID , hditemWtUnit: product.hditemWtUnit, maximumPossible: product.maximumPossible, availabilitytime: product.availabilitytime, availabilityperiod: product.availabilityperiod));
        String id = DateTime.now().millisecondsSinceEpoch.toString();
        product.uniqueID = id;
        totalPrice();
      } else {
        for (int i = 0; i < itemController.cart.length; i++) {
          if (product.quantity != 0) {
            if (cart[i].uniqueID == product.uniqueID &&
                cart[i].slot == product.slot &&
                cart[i].date == product.date) {
              cart[i].quantity = product.quantity;
              return;
            } else if (product.uniqueID == "") {
              final requestParamPrebook = Cart(deliveryDate: product.date, deliverySlot: product.slot, cartAddedItems: [CartAddedItem(itemId: product.itemId,slot: product.slot,date: product.date, productName: product.productName, displayName: product.displayName, onlineCategoryName: product.onlineCategoryName, unitPrice: product.unitPrice, itemWtForHd: product.itemWtForHd,quantity: product.quantity,uniqueID: product.uniqueID , hditemWtUnit: product.hditemWtUnit, maximumPossible: product.maximumPossible, availabilitytime: product.availabilitytime, availabilityperiod: product.availabilityperiod)]);
              cartProduct.add(CartProduct(Cartitems: [requestParamPrebook]));
              cartDate.add(requestParamPrebook);
              cart.add(CartAddedItem(itemId: product.itemId,slot: product.slot,date: product.date, productName: product.productName, displayName: product.displayName, onlineCategoryName: product.onlineCategoryName, unitPrice: product.unitPrice, itemWtForHd: product.itemWtForHd,quantity: product.quantity,uniqueID: product.uniqueID , hditemWtUnit: product.hditemWtUnit, maximumPossible: product.maximumPossible, availabilitytime: product.availabilitytime, availabilityperiod: product.availabilityperiod));

              String id = DateTime.now().millisecondsSinceEpoch.toString();
              cart[i].uniqueID = id;
              product.uniqueID = id;
              return;
            }
          }
        }
      }

      totalPrice();

      if (kDebugMode) {
        print(cart.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void removeProductToCart(index) {
    try {
      isLoading(true);
      cart[index].quantity = 0;
      cart[index].uniqueID = "";
      cart.removeAt(index);
      totalPrice();
      if (kDebugMode) {
        print(cart.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void removeProductFromCart(PrebookItem product) {
    try {
      isLoading(true);
      itemController.cart
          .removeWhere((item) => item.uniqueID == product.uniqueID);

      totalPrice();

      if (kDebugMode) {
        print(cart.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void totalamount() {
    isLoading(true);

    totalPrice();
  }

  Future<double> totalPrice() async {
    // add your price calculation logic
    try {
      isLoading(true);
      total = 0.0;
      for (var item in cart) {
        total += 5;
      }
      print("Total Value in Cart" + total.toString());
      if (kDebugMode) {
        print("Total Value in Cart" + total.toString());
      }
      return total;
    } finally {
      Future.delayed(Duration(microseconds: 3000), () async {
        isLoading(false);
      });
    }
  }
}
