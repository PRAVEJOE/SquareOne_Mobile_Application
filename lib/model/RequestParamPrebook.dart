class RequestParamPrebook {
  String date;

  RequestParamPrebook({
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {"searchdate": date};
  }
}
