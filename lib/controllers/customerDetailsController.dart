import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/model/customerfulldetails.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class CustomerDetailsController extends GetxController {
  var isLoading = true.obs;
  var customerDetail = <CustomerDetail>[].obs;
  var address=<Address>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getCustomerDetail();
  }

  Future<void> getCustomerDetail() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? customerID = prefs.getString('customerID');
      if (customerID.toString() != null) {
        String? phoneNo = (prefs.getString('phoneNo'));
        if (phoneNo != null&&phoneNo != "") {
          final result = await RemoteServices.getCustomerDetails(phoneNo);
          if (result.Cartitems.toString().length != 2) {
            customerDetail.clear();
            customerDetail.value = result.Cartitems;
            address.clear();
            for (int i = 0; i < result.Cartitems[0].address.length; i++) {
              if (result.Cartitems[0].address[i].customerId != "") {
                address.add(result.Cartitems[0].address[i]);
              }
            }

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'firstName', result.Cartitems[0].firstName.toString().toUpperCase());
            await prefs.setString(
                'lastName', result.Cartitems[0].lastName.toString().toUpperCase());
            await prefs.setString(
                'customerID',
                result.Cartitems[0].customerId.toString().toUpperCase());
            await prefs.setString(
                'phoneNo', result.Cartitems[0].phone.toString().toUpperCase());

          }
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
