// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CustomerDetails customerFromJson(String str) => CustomerDetails.fromJson(json.decode(str));

String welcomeToJson(CustomerDetails data) => json.encode(data.toJson());

class CustomerDetails {
  CustomerDetails({
    required this.result,
    required this.data,
  });

  Result result;
  List<CustomerDetail> data;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
    result: Result.fromJson(json["Result"]),
    data: List<CustomerDetail>.from(json["Data"].map((x) => CustomerDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CustomerDetail {
  CustomerDetail({
    this.customerId='',
    this.firstName='',
    this.lastName='',
    this.nickName='',
    required this.privilegedCustomer,
    this.phone='',
    this.phone2='',
    this.email='',
    this.barcodeNumber='',
    this.remarks='',
    this.alert='',
    this.refferedBy='',
    required this.isActive,
    this.privilegeCardIssued='',
    this.promoCallsOpted='',
    this.promoMailsOpted='',
    this.createdOn='',
    required this.isphoneActive,
    this.fundAmount=0,
    required this.isNewCustomer,
    this.gsTnumber='',
    required this.customerType,
    required this.address,
  });

  String customerId;
  String firstName;
  String lastName;
  String nickName;
  bool privilegedCustomer;
  String phone;
  String phone2;
  String email;
  String barcodeNumber;
  String remarks;
  String alert;
  String refferedBy;
  bool isActive;
  String privilegeCardIssued;
  String promoCallsOpted;
  String promoMailsOpted;
  String createdOn;
  bool isphoneActive;
  double fundAmount;
  bool isNewCustomer;
  String gsTnumber;
  int customerType;
  List<Address> address;

  factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
    customerId: json["CustomerID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    nickName: json["NickName"],
    privilegedCustomer: json["PrivilegedCustomer"],
    phone: json["Phone"],
    phone2: json["Phone2"],
    email: json["Email"],
    barcodeNumber: json["BarcodeNumber"],
    remarks: json["Remarks"],
    alert: json["Alert"],
    refferedBy: json["RefferedBy"],
    isActive: json["IsActive"],
    privilegeCardIssued: json["PrivilegeCardIssued"],
    promoCallsOpted: json["PromoCallsOpted"],
    promoMailsOpted: json["PromoMailsOpted"],
    createdOn: json["CreatedOn"],
    isphoneActive: json["IsphoneActive"],
    fundAmount: json["FundAmount"],
    isNewCustomer: json["isNewCustomer"],
    gsTnumber: json["GSTnumber"],
    customerType: json["customerType"],
    address: List<Address>.from(json["Address"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CustomerID":customerId,
    "FirstName": firstName,
    "LastName": lastName,
    "NickName": nickName,
    "PrivilegedCustomer": privilegedCustomer,
    "Phone": phone,
    "Phone2": phone2,
    "Email": email,
    "BarcodeNumber": barcodeNumber,
    "Remarks": remarks,
    "Alert": alert,
    "RefferedBy": refferedBy,
    "IsActive": isActive,
    "PrivilegeCardIssued": privilegeCardIssued,
    "PromoCallsOpted": promoCallsOpted,
    "PromoMailsOpted": promoMailsOpted,
    "CreatedOn": createdOn,
    "IsphoneActive": isphoneActive,
    "FundAmount": fundAmount,
    "isNewCustomer": isNewCustomer,
    "GSTnumber": gsTnumber,
    "customerType": customerType,
    "Address": List<dynamic>.from(address.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.addressId="",
    this.customerId="",
    this.addressType="",
    this.fullName="",
    this.contactNumber="",
    this.alternativeNumber="",
    this.addressPreferenceSequence=0,
    this.address="",
    this.landMark="",
    this.region="",
    this.houseNumber="",
    this.remarks="",
    this.pincode="",
    this.isGiftaddress="",
    this.kilometer="",
    required this.hDfromShop
  });

  String addressId;
  String customerId;
  String addressType;
  String fullName;
  String contactNumber;
  String alternativeNumber;
  int addressPreferenceSequence;
  String address;
  String landMark;
  String region;
  String houseNumber;
  String remarks;
  String pincode;
  String isGiftaddress;
  String kilometer;
  int hDfromShop;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressId: json["AddressID"],
    customerId: json["CustomerID"],
    addressType: json["AddressType"],
    fullName: json["FullName"],
    contactNumber: json["ContactNumber"],
    alternativeNumber: json["alternativeNumber"],
    addressPreferenceSequence: json["AddressPreferenceSequence"],
    address: json["Address"],
    landMark: json["LandMark"],
    region: json["Region"],
    houseNumber: json["HouseNumber"],
    remarks: json["Remarks"],
    pincode: json["Pincode"],
    isGiftaddress: json["isGiftaddress"],
    kilometer: json["kilometer"],
      hDfromShop:json["HDfromShop"]
  );

  Map<String, dynamic> toJson() => {
    "AddressID": addressId,
    "CustomerID": customerId,
    "AddressType": addressType,
    "FullName": fullName,
    "ContactNumber": contactNumber,
    "alternativeNumber":alternativeNumber,
    "AddressPreferenceSequence": addressPreferenceSequence,
    "Address": address,
    "LandMark": landMark,
    "Region": region,
    "HouseNumber":houseNumber,
    "Remarks": remarks,
    "Pincode": pincode,
    "isGiftaddress": isGiftaddress,
    "kilometer": kilometer,
    "HDfromShop":hDfromShop
  };
}

enum AddressType { HOME, SHOP }

final addressTypeValues = EnumValues({
  "Home": AddressType.HOME,
  "Shop": AddressType.SHOP
});

enum LandMark { EMPTY, PATTOM, NEAR_CHURCH }


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
