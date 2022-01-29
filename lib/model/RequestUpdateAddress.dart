import 'package:intl/intl.dart';



class RequestUpdatedAddress {
  RequestUpdatedAddress({
    required this.address,
    required this.version,
  });
  List<AddressSendParams> address;
  int version;
  Map<String, dynamic> toJson() => {
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
    "version": version,
  };


}

class AddressSendParams {
  String addressId;
  String customerId;
  String fullName;
  String address;
  String contactNumber;
  String alternativeNumber;
  String pincode;
  String houseNumber;
  String landMark;
  String addressType;
  String region;
  String hDfromShop;
  String isGiftaddress;
  String kilometer;

  AddressSendParams({
    required this.addressId,
    this.customerId = "",
    this.fullName = "",
    this.address = "",
    this.contactNumber = "",
    this.alternativeNumber = "",
    this.pincode = "",
    this.houseNumber = "",
    this.landMark = "",
    this.addressType = "",
    this.region = "",
    this.hDfromShop = "",
    this.isGiftaddress = "",
    this.kilometer = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "AddressID": addressId,
      "CustomerID": customerId,
      "FullName": fullName,
      "Address": address,
      "ContactNumber": contactNumber,
      "alternativeNumber": alternativeNumber,
      "Pincode": pincode,
      "HouseNumber": houseNumber,
      "LandMark": landMark,
      "AddressType": addressType,
      "Region": region,
      "HDfromShop": hDfromShop,
      "isGiftaddress": isGiftaddress,
      "kilometer": kilometer,
    };
  }
}
