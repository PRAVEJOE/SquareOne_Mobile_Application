// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PrebookProduct prebookProductFromJson(String str) => PrebookProduct.fromJson(json.decode(str));

String prebookProductToJson(PrebookProduct data) => json.encode(data.toJson());

class PrebookProduct {
  PrebookProduct({
    required this.result,
    required this.data,
    this.orderTotal="0.0",
  });

  Result result;
  List<Datum> data;
  String orderTotal;

  factory PrebookProduct.fromJson(Map<String, dynamic> json) => PrebookProduct(
    result: Result.fromJson(json["Result"]),
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    orderTotal: json["0rderTotal"] == null ? "0.0" : json["0rderTotal"]
  );

  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    "orderTotal":orderTotal,
  };
}

class Datum {
  Datum({
    required this.deliverySlot,
    required this.prebookItems,
  });

  String deliverySlot;
  List<PrebookItem> prebookItems;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    deliverySlot: json["deliverySlot"],
    prebookItems: List<PrebookItem>.from(json["prebookItems"].map((x) => PrebookItem.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "deliverySlot": deliverySlot,
    "prebookItems": List<dynamic>.from(prebookItems.map((x) => x.toJson())),

  };
}

class PrebookItem {
  PrebookItem({
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

  factory PrebookItem.fromJson(Map<String, dynamic> json) => PrebookItem(
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
