import 'package:get/state_manager.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/product.dart';
import 'package:square_one_mobile_app/screens/prebook/components/prebook_product.dart';
import 'package:square_one_mobile_app/screens/prebook/prebook_screen.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class PrebookProductController extends GetxController {

  var isLoading = true.obs;
  var productList = <Datum>[].obs;
  var dateslot =<Datum>[].obs;
  var ab=0;

  var prebookDate ="2021-11-09";
  String prebookTime ="12:00 PM";



  @override
  Future<void> onInit() async {
    getPrebookItems();
    getPrebookDateSot();
    super.onInit();

  }



  void listprebookItemDate(String index) async {
    prebookDate= index;
  }

  void listprebookItemTime(String time) async{
    prebookTime = time;
  }


  Future<void> getPrebookItems() async {
    final requestParamPrebook = RequestParamPrebook(
        date: prebookDate,
        time: prebookTime);

    final result1 =
    await RemoteServices.getPrebookItems(requestParamPrebook);
    print(result1);
    productList.value = result1.data;


  }
  Future<void> getPrebookDateSot() async {

    final result1 =
    await RemoteServices.getPrebookDateSlot();
    print(result1);
    dateslot.value = result1.data;


  }
}
