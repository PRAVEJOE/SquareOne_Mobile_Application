// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PrebookDateSlot welcomeFromJson(String str) => PrebookDateSlot.fromJson(json.decode(str));

String welcomeToJson(PrebookDateSlot data) => json.encode(data.toJson());

class PrebookDateSlot {
  PrebookDateSlot({
    required this.result,
    required this.data,
  });

  Result result;
  List<PrebookDateAndSlot> data;

  factory PrebookDateSlot.fromJson(Map<String, dynamic> json) => PrebookDateSlot(
    result: Result.fromJson(json["Result"]),
    data: List<PrebookDateAndSlot>.from(json["Data"].map((x) => PrebookDateAndSlot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PrebookDateAndSlot {
  PrebookDateAndSlot({
    required this.days,
    required this.preBookSlots,
  });

  String days;
  List<PreBookSlot> preBookSlots;

  factory PrebookDateAndSlot.fromJson(Map<String, dynamic> json) => PrebookDateAndSlot(
    days: json["days"],
    preBookSlots: List<PreBookSlot>.from(json["prebookslots"].map((x) => PreBookSlot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "days": days,
    "prebookslots": List<dynamic>.from(preBookSlots.map((x) => x.toJson())),
  };
}

class PreBookSlot {
  PreBookSlot({
    this.slotsNames='',
    this.days='',
  });

  String slotsNames;
  String days;

  factory PreBookSlot.fromJson(Map<String, dynamic> json) => PreBookSlot(
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
