// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CustomerUpdate customerUpdateFromJson(String str) => CustomerUpdate.fromJson(json.decode(str));

String welcomeToJson(CustomerUpdate data) => json.encode(data.toJson());

class CustomerUpdate {
  CustomerUpdate({
    required this.success,
    required this.error,
    required this.resultVal,
  });

  bool success;
  Error error;
  ResultVal resultVal;

  factory CustomerUpdate.fromJson(Map<String, dynamic> json) => CustomerUpdate(
    success: json["Success"],
    error: Error.fromJson(json["Error"]),
    resultVal: ResultVal.fromJson(json["ResultVal"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Error": error.toJson(),
    "ResultVal": resultVal.toJson(),
  };
}

class Error {
  Error({
    required this.errorTitle,
    required this.errorMessage,
  });

  String errorTitle;
  String errorMessage;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    errorTitle: json["ErrorTitle"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "ErrorTitle": errorTitle,
    "ErrorMessage": errorMessage,
  };
}

class ResultVal {
  ResultVal({
    required this.customerId,
    required this.credAmt,
  });

  String customerId;
  String credAmt;

  factory ResultVal.fromJson(Map<String, dynamic> json) => ResultVal(
    customerId: json["CustomerID"],
    credAmt: json["CredAmt"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerID": customerId,
    "CredAmt": credAmt,
  };
}
