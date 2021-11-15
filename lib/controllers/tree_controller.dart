import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/screens/prebook/components/cateogry_selector_2.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class TreeController extends GetxController {
  var isLoading = true.obs;
  var productList = <Datum>[].obs;
  var tabSelected = 0;
  List<Datum> snacksList = []; //for sorting snacks
  List<Datum> cakesList = []; //for sorting cakes
  List<Datum> takeAwayList = []; //for sorting take away
  List<Datum> condimentList = []; //for sorting condiments
  String prebookDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now()); // get current date initially

  String prebookTime = "10:00 AM";

  @override
  Future<void> onInit() async {
    getPrebookItems();
    snacksList.clear();
    cakesList.clear();
    takeAwayList.clear();
    condimentList.clear();
    super.onInit();
  }

  void CategorySelected(int index) async {
    tabSelected = index;
    getPrebookItems();
    super.onInit();
  }

  void listprebookItemDate(String index) async {
    prebookDate = index;
    snacksList.clear();
    cakesList.clear();
    takeAwayList.clear();
    condimentList.clear();

    getPrebookItems();
  }

  void listprebookItemTime(String time) async {
    prebookTime = time;
    snacksList.clear();
    cakesList.clear();
    takeAwayList.clear();
    condimentList.clear();

    getPrebookItems();
  }

  Future<void> getPrebookItems() async {
    try {
      isLoading(true);
      final requestParamPrebook =
          RequestParamPrebook(date: prebookDate, time: prebookTime);

      final result1 = await RemoteServices.getPrebookItems(requestParamPrebook);

      print(result1);
      print(tabSelected);
      for (var i = 0; i < result1.data.length; i++) {
        if (result1.data[i].onlineCategoryName == "SNACKS") {
          snacksList.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "CAKES") {
          cakesList.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "TAKE AWAYS") {
          takeAwayList.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "CONDIMENTS") {
          condimentList.add(result1.data[i]);
        }
      }

      if (tabSelected == 0) {
        productList.value = result1.data;

      } else if (tabSelected == 1) {
        productList.value = cakesList;

      } else if (tabSelected == 2) {
        productList.value = snacksList;

      } else if (tabSelected == 3) {
        productList.value = takeAwayList;

      } else if (tabSelected == 4) {
        productList.value = condimentList;

      }
    } finally {
      isLoading(false);
    }
  }
}
