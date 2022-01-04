// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.result,
    required this.data,
  });

  Result result;
  List<Datum> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
    required this.days,
    required this.prebookslots,
  });

  String days;
  List<Prebookslot> prebookslots;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    days: json["days"],
    prebookslots: List<Prebookslot>.from(json["prebookslots"].map((x) => Prebookslot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "days": days,
    "prebookslots": List<dynamic>.from(prebookslots.map((x) => x.toJson())),
  };
}

class Prebookslot {
  Prebookslot({
    this.slotsNames='',
    this.days='',
  });

  String slotsNames;
  String days;

  factory Prebookslot.fromJson(Map<String, dynamic> json) => Prebookslot(
    slotsNames: json["slotsNames"],
    days: json["days"],
  );

  Map<String, dynamic> toJson() => {
    "slotsNames": slotsNames,
    "days": days,
  };
}

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
