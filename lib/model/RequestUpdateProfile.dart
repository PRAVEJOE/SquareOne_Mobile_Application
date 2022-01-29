import 'package:intl/intl.dart';

DateTime now = DateTime.now();
late String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

class RequestUpdateProfile {
  String customerID;
  bool isNewCustomer;
  String firstName;
  String lastName;
  String phone;
  String altPhone;
  String remarks;
  String alert;
  String version;

  RequestUpdateProfile(
      {this.customerID = "",
      required this.isNewCustomer,
      required this.firstName,
      this.lastName = "",
      required this.phone,
      this.altPhone = "",
      this.remarks = "New Customer",
      this.alert = "",
      this.version = "38"});

  Map<String, dynamic> toJson() {
    return {
      "CustomerID": customerID,
      "isNewCustomer": isNewCustomer,
      "FirstName": firstName,
      "LastName": lastName,
      "Phone": phone,
      "Phone2": altPhone,
      "Remarks": remarks,
      "Alert": alert,
      "version": version
    };
  }
}
