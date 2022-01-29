// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CartProduct cartProductFromJson(String str) => CartProduct.fromJson(json.decode(str));

String cartProductToJson(CartProduct data) => json.encode(data.toJson());

class CartProduct {
  CartProduct({
    required this.Cartitems,
  });

  List<Cart> Cartitems;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
      Cartitems: List<Cart>.from(json["Data"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": List<dynamic>.from(Cartitems.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.deliveryDate,
    required this.deliverySlot,
    required this.cartAddedItems,
  });

  String deliveryDate;
  String deliverySlot;
  List<CartAddedItem> cartAddedItems;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    deliveryDate: json["deliveryDate"],
    deliverySlot: json["deliverySlot"],
    cartAddedItems: List<CartAddedItem>.from(json["cartItems"].map((x) => CartAddedItem.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "deliveryDate":deliveryDate,
    "deliverySlot": deliverySlot,
    "cartItems": List<dynamic>.from(cartAddedItems.map((x) => x.toJson())),

  };
}

class CartAddedItem {
  CartAddedItem({
    required this.itemId,
    required this.productName,
    required this.displayName,
    required this.onlineCategoryName,
    required this.unitPrice,
    required this.itemWtForHd,
    required this.hditemWtUnit,
    this.quantity = 0,
    required this.maximumPossible,
    this.date = "",
    this.slot = "",
    this.uniqueID = "",
    required this.availabilitytime,
    required this.availabilityperiod,
    this.total=0.0,
    this.caption=""
  });

  String itemId;
  String productName;
  String displayName;
  String onlineCategoryName;
  String unitPrice;
  String itemWtForHd;
  String hditemWtUnit;
  String maximumPossible;
  String date;
  String slot;
  int quantity;
  String uniqueID;
  String availabilitytime;
  String availabilityperiod;
  double total;
  String caption;

  factory CartAddedItem.fromJson(Map<String, dynamic> json) => CartAddedItem(
    itemId: json["itemID"],
    productName: json["ProductName"],
    displayName: json["DisplayName"],
    onlineCategoryName: json["OnlineCategoryName"],
    unitPrice: json["UnitPrice"],
    itemWtForHd: json["ItemWtForHD"],
    hditemWtUnit: json["HDitemWtUnit"],
    maximumPossible: json["maximumPossible"],
    quantity: json["quantity"] == null ? 0 : json["quantity"],
    date: json["date"] == null ? "" : json["date"],
    slot: json["slot"] == null ? "" : json["slot"],
    uniqueID: json["uniqueID"] == null ? "" : json["uniqueID"],
    availabilitytime: json["availabilitytime"],
    availabilityperiod: json["availabilityperiod"],
    total: json["total"] ?? 0.0,
    caption: json["caption"]== null ? "" : json["caption"],
  );

  Map<String, dynamic> toJson() => {
    "itemID": itemId,
    "ProductName": productName,
    "DisplayName": displayName,
    "OnlineCategoryName": onlineCategoryName,
    "UnitPrice": unitPrice,
    "ItemWtForHD": itemWtForHd,
    "HDitemWtUnit": hditemWtUnit,
    "maximumPossible": maximumPossible,
    "quantity": quantity,
    "date": date,
    "slot": slot,
    "uniqueID": uniqueID,
    "availabilitytime": availabilitytime,
    "availabilityperiod": availabilityperiod,
    "total":total
  };
}

enum HDitemWtUnit { KG }

final hDitemWtUnitValues = EnumValues({
  "Kg": HDitemWtUnit.KG
});

enum OnlineCategoryName { SNACKS, CAKES }

final onlineCategoryNameValues = EnumValues({
  "CAKES": OnlineCategoryName.CAKES,
  "SNACKS": OnlineCategoryName.SNACKS
});

class Result {
  Result({
    required this.status,
    required this.success,
    required this.reason,
  });

  int status;
  bool success;
  String reason;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    status: json["Status"],
    success: json["Success"],
    reason: json["Reason"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Success": success,
    "Reason": reason,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
