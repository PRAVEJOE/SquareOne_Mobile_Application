import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/prebookDateSlot.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class TreeController extends GetxController {
  var isLoading = true.obs;
  var slotDateIsLoading = true.obs;
  var slotIsLoading = true.obs;
  var categoryIsLoading = true.obs;
  var productIsLoading = true.obs;
  var productList = <PrebookItem>[].obs;
  var preebookSlotBasedData = <Datum>[].obs;
  var prebookDateSlotList = <PrebookDateAndSlot>[].obs;
  var dateSlot = <String>[].obs;

  var preBookDate = <DateTime>[].obs;
  var preBookDateSlotDate = <DateTime>[].obs;

  List<PrebookDateAndSlot> preBookDateSlot = [];
  List categoryPreBook=<String>[].obs;

  var tabSelected = "";

  var productCategoryBased = <PrebookItem>[].obs;


  String prebookDate = ""; // get current date initially
  String prebookTime = "";

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void categorySelected(int index, selectedCategory) async {
    productIsLoading(true);
    tabSelected=selectedCategory;
    prebookSlotFilter();
    super.onInit();
  }

  void listPrebookItemTime(String time) async {
    categoryIsLoading(true);
    prebookTime = time;
    tabSelected="";
    prebookSlotFilter();
  }

  void slotDate() async {
    categoryPreBook.clear();
    prebookDate = "";
    prebookTime = "";
    tabSelected="";
    categoryIsLoading(true);
    getPrebookDateSlot();
  }

  void listPrebookItemDate(String index) async {
    isLoading(true);
    categoryIsLoading(true);
    prebookDate = index;
    prebookTime = "";
    tabSelected="";
    getPrebookSlot();
  }

  Future<void> getPrebookSlot() async {
    try {
      slotDateIsLoading(true);
      preBookDateSlotDate.clear();
      for (int i = 0; i < prebookDateSlotList.length; i++) {
        var inputFormat = DateFormat('dd-MM-yyyy');
        var inputDate = inputFormat.parse(prebookDateSlotList[i].days); // <-- dd/MM 24H format
        var outputFormat = DateFormat('yyyy-MM-dd');
        var outputDate = outputFormat.format(inputDate);
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(outputDate);
        preBookDateSlotDate.add(tempDate);
      }
      String outDate = "";
      String updated = '';
      if (preBookDateSlotDate.length != 0) {
        if (prebookDate == "") {
          DateTime dateFormat = DateFormat("yyyy-MM-dd").parse(preBookDateSlotDate.first.toString());
          var dateFormatted = DateFormat('yyyy-MM-dd');
          outDate = dateFormatted.format(dateFormat);
          var dateFormats = DateFormat('dd-MM-yyyy');
          updated = dateFormats.format(dateFormat);
          prebookDate = outDate;
        } else {
          DateTime dateFormat = DateFormat("yyyy-MM-dd").parse(prebookDate);
          var dateFormatted = DateFormat('yyyy-MM-dd');
          outDate = dateFormatted.format(dateFormat);
          var dateFormats = DateFormat('dd-MM-yyyy');
          updated = dateFormats.format(dateFormat);
        }
        slotIsLoading(true);
        dateSlot.clear();
        for (int i = 0; i < prebookDateSlotList.length; i++) {
          for (var j = 0; j < prebookDateSlotList[i].preBookSlots.length; j++) {
            if (prebookDateSlotList[i].preBookSlots[j].days == updated) {
              dateSlot.add(prebookDateSlotList[i].preBookSlots[j].slotsNames);
            }
          }
        }
        if (prebookTime == "") {
          prebookTime = dateSlot.first;
        }
        getPrebookItems();
      }
    } finally {
      Future.delayed(const Duration(milliseconds: 100), () {

        slotIsLoading(false);
        slotDateIsLoading(false);

      });
      slotDateIsLoading(false);
    }
  }

  void updateProduct() async {
   productIsLoading(true);
   prebookSlotFilter();
  }

  Future<void> getPrebookDateSlot() async {
    try {
      isLoading(true);
      slotDateIsLoading(true);
      final result1 = await RemoteServices.getPrebookDateSlot();
      if (result1 == null) {
        dateSlot.clear();
        preBookDate.clear();
        prebookDateSlotList.clear();
        categoryPreBook.clear();
        return;
      }
      dateSlot.clear();
      preBookDate.clear();
      categoryPreBook.clear();
      prebookDateSlotList.value = result1.data;
      getPrebookSlot();
    } finally {
      slotDateIsLoading(false);
    }
  }

  Future<void> getPrebookItems() async {
    try {
      final requestParamPrebook = RequestParamPrebook(date: prebookDate);
      final result1 = await RemoteServices.getPrebookItems(requestParamPrebook);
      preebookSlotBasedData.clear();
      if (result1 == null) {
        productCategoryBased.clear();
        preebookSlotBasedData.clear();
        return;
      }
      preebookSlotBasedData.value = result1.data;
      prebookSlotFilter();

    } finally {
      slotDateIsLoading(false);
    }
  }

  void tabSelect() {
    try {
        for (var i = 0; i < productCategoryBased.length; i++) {

          if (itemController.cart.length != 0) {
            for (var k = 0; k < itemController.cart.length; k++) {
              if (itemController.cart[k].productName == productCategoryBased[i].productName && itemController.cart[k].slot == productCategoryBased[i].slot && itemController.cart[k].date == productCategoryBased[i].date) {
                productCategoryBased[i].uniqueID = itemController.cart[k].uniqueID;
                productCategoryBased[i].quantity = itemController.cart[k].quantity;
              }
            }
          }
        }
        productList.value = productCategoryBased;
    } finally {
      Future.delayed(const Duration(milliseconds: 5), () {
    categoryIsLoading(false);
    productIsLoading(false);
      });
    }
  }

  Future<void> prebookSlotFilter() async {
    try {
      isLoading(true);
      productCategoryBased.clear();
      categoryPreBook.clear();
      var result1 = preebookSlotBasedData;
      for (var i = 0; i < result1.length; i++) {
        if (result1[i].deliverySlot == prebookTime) {
          for (var l = 0; l < result1[i].prebookItems.length; l++) {
            categoryPreBook.add(result1[i].prebookItems[l].onlineCategoryName);
            DateTime myDT = DateTime.now(); //Current DateTime
            DateTime EastCoast = dateTimeToZone(zone: "IST", datetime: myDT);
            String formattedDate =
            DateFormat('kk:mm:ss').format(EastCoast); //DateTime in EST zone

            var three = formattedDate;
            var format = DateFormat("HH:mm:ss");
            var one =
            format.parse(result1[i].prebookItems[l].availabilitytime);
            var two = format.parse(formattedDate);

            DateTime dateFormat = DateFormat("yyyy-MM-dd").parse(prebookDate);
            var dateFormatted = DateFormat('yyyy-MM-dd');
            var currentDateFormatted = dateFormatted.parse(myDT.toString());

            int number = int.parse(dateFormat.difference(currentDateFormatted).inDays.toString());

            if ((number - 1).toString() == result1[i].prebookItems[l].availabilityperiod) {
              if (!one.difference(two).isNegative) {
                print(tabSelected+"selsected");
                if(tabSelected.isEmpty){
                  tabSelected=categoryPreBook.first;
                }

                if (result1[i].prebookItems[l].onlineCategoryName == tabSelected) {
                  productCategoryBased.add(result1[i].prebookItems[l]);
                  for (var k = 0; k < productCategoryBased.length; k++) {
                    productCategoryBased[k].date = prebookDate;
                    productCategoryBased[k].slot = prebookTime;

                  }

                }
              }
            } else if ((number - 1).toString() != result1[i].prebookItems[l].availabilityperiod) {
              print(tabSelected+"selected");
              if(tabSelected.isEmpty){
                tabSelected=categoryPreBook.first;
              }
              if (result1[i].prebookItems[l].onlineCategoryName == tabSelected) {
                productCategoryBased.add(result1[i].prebookItems[l]);
                for (var k = 0; k < productCategoryBased.length; k++) {
                  productCategoryBased[k].date = prebookDate;
                  productCategoryBased[k].slot = prebookTime;
                }
              }
            }
          }
        }
        categoryPreBook = categoryPreBook.toSet().toList();
        //productList.value = result1.data;
        tabSelect();
      }
    }finally{
      isLoading(false);
    }
  }
}
