

import 'dart:convert';

PrebookProduct prebookProductFromJson(String str) => PrebookProduct.fromJson(json.decode(str));

String prebookProductToJson(PrebookProduct data) => json.encode(data.toJson());

class PrebookProduct {
  PrebookProduct({
   required this.result,
   required this.data,
  });

  Result result;
  List<Datum> data;

  factory PrebookProduct.fromJson(Map<String, dynamic> json) => PrebookProduct(
    result: Result.fromJson(json["Result"]),
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );



  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
   required this.itemId,
    required this.productName,
    required this.displayName,
    required this.onlineCategoryName,
    required this.unitPrice,
    required this.itemWtForHd,
    required this.hDitemWtUnit,
    required this.maximumPossible,
  });

  String itemId;
  String productName;
  String displayName;
  String onlineCategoryName;
  String unitPrice;
  String itemWtForHd;
  String hDitemWtUnit;
  String maximumPossible;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    itemId: json["itemID"],
    productName: json["ProductName"],
    displayName: json["DisplayName"],
    onlineCategoryName: json["OnlineCategoryName"],
    unitPrice: json["UnitPrice"],
    itemWtForHd: json["ItemWtForHD"],
    hDitemWtUnit: json["HDitemWtUnit"],
    maximumPossible: json["maximumPossible"],
  );

  Map<String, dynamic> toJson() => {
    "itemID": itemId,
    "ProductName": productName,
    "DisplayName": displayName,
    "OnlineCategoryName": onlineCategoryNameValues.reverse[onlineCategoryName],
    "UnitPrice": unitPrice,
    "ItemWtForHD": itemWtForHd,
    "HDitemWtUnit": hDitemWtUnitValues.reverse[hDitemWtUnit],
    "maximumPossible": maximumPossible,
  };
}

enum HDitemWtUnit { KG, ML }

final hDitemWtUnitValues = EnumValues({
  "Kg": HDitemWtUnit.KG,
  "ml": HDitemWtUnit.ML
});

enum OnlineCategoryName { SNACKS, CONDIMENTS, SPECIALS, TAKE_AWAYS, CAKES }

final onlineCategoryNameValues = EnumValues({
  "CAKES": OnlineCategoryName.CAKES,
  "CONDIMENTS": OnlineCategoryName.CONDIMENTS,
  "SNACKS": OnlineCategoryName.SNACKS,
  "SPECIALS": OnlineCategoryName.SPECIALS,
  "TAKE AWAYS": OnlineCategoryName.TAKE_AWAYS
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
