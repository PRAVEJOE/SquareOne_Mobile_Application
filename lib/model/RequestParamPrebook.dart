class RequestParamPrebook {
  String date;
  String time;

  RequestParamPrebook({
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {"searchdate": date, "searchTime": time};
  }
}
