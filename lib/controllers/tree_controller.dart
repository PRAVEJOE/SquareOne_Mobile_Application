import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';
import 'package:square_one_mobile_app/model/RequestParamPrebook.dart';
import 'package:square_one_mobile_app/model/prebookDateSlot.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class TreeController extends GetxController {
  var isLoading = true.obs;
  var slotDateIsLoading = true.obs;
  var slotIsLoading = true.obs;
  var productList = <Datum>[].obs;

  var prebookDateSlotList = <PrebookDateAndSlot>[].obs;

  var dateSlot = <String>[].obs;
  var preBookDate = <DateTime>[].obs;
  var preBookDateSlotDate = <DateTime>[].obs;
  List<PrebookDateAndSlot> preBookDateSlot = [];
  var tabSelected = 0;
  List<Datum> all = [];
  List<Datum> snacksList = []; //for sorting snacks
  List<Datum> cakesList = []; //for sorting cakes
  List<Datum> takeAwayList = []; //for sorting take away
  List<Datum> condimentList = []; //for sorting condiments

  String prebookDate = ""; // get current date initially
  String prebookTime = "";

  @override
  Future<void> onInit() async {
    super.onInit();
    // getPrebookDateSlot();
  }

  void categorySelected(int index) async {
    tabSelected = index;
    tabSelect();
    super.onInit();
  }

  void listPrebookItemTime(String time) async {
    prebookTime = time;
    getPrebookItems();
  }

  void slotDate() async {
    prebookDate = "";
    prebookTime = "";
    getPrebookDateSlot();
  }

  void listPrebookItemDate(String index) async {
    prebookDate = index;
    prebookTime = "";
    getPrebookSlot();
  }

  Future<void> getPrebookSlot() async {
    try {
      slotDateIsLoading(true);
      preBookDateSlotDate.clear();
      for (int i = 0; i < prebookDateSlotList.length; i++) {
        var inputFormat = DateFormat('dd-MM-yyyy');
        var inputDate = inputFormat
            .parse(prebookDateSlotList[i].days); // <-- dd/MM 24H format

        var outputFormat = DateFormat('yyyy-MM-dd');
        var outputDate = outputFormat.format(inputDate);
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(outputDate);
        preBookDateSlotDate.add(tempDate);
      }
      String outDate = "";
      String updated = '';
      if (prebookDate == "") {
        DateTime dateFormat = DateFormat("yyyy-MM-dd")
            .parse(preBookDateSlotDate.first.toString());
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

      print(dateSlot);
      getPrebookItems();
      Future.delayed(Duration(milliseconds: 200), () {
        slotIsLoading(false);
      });
    } finally {
      slotDateIsLoading(false);
    }
  }

  Future<void> getPrebookDateSlot() async {
    try {
      slotDateIsLoading(true);
      final result1 = await RemoteServices.getPrebookDateSlot();
      if (result1 == null) {
        dateSlot.clear();
        preBookDate.clear();
        prebookDateSlotList.clear();
        return;
      }
      print("Data Length " + result1.data.length.toString());
      dateSlot.clear();
      preBookDate.clear();
      prebookDateSlotList.value = result1.data;
      getPrebookSlot();
    } finally {
      slotDateIsLoading(false);
    }
  }

  Future<void> getPrebookItems() async {
    try {
      isLoading(true);
      final requestParamPrebook =
          RequestParamPrebook(date: prebookDate, time: prebookTime);

      final result1 = await RemoteServices.getPrebookItems(requestParamPrebook);
      // await RemoteServices.getPrebookDateSlot();
      if (result1 == null) {
        all.clear();
        snacksList.clear();
        cakesList.clear();
        takeAwayList.clear();
        condimentList.clear();
        return;
      }
      all.clear();
      snacksList.clear();
      cakesList.clear();
      takeAwayList.clear();
      condimentList.clear();
      for (var i = 0; i < result1.data.length; i++) {
        if (result1.data[i].onlineCategoryName == "SNACKS") {
          snacksList.add(result1.data[i]);
          all.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "CAKES") {
          cakesList.add(result1.data[i]);
          all.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "TAKE AWAYS") {
          takeAwayList.add(result1.data[i]);
          all.add(result1.data[i]);
        } else if (result1.data[i].onlineCategoryName == "CONDIMENTS") {
          condimentList.add(result1.data[i]);
          all.add(result1.data[i]);
        }
      }

      productList.value = result1.data;
      tabSelect();
    } finally {
      isLoading(false);
    }
  }

  void tabSelect() {
    if (tabSelected == 0) {
      productList.value = all;
    } else if (tabSelected == 1) {
      productList.value = cakesList;
    } else if (tabSelected == 2) {
      productList.value = snacksList;
    } else if (tabSelected == 3) {
      productList.value = takeAwayList;
    } else if (tabSelected == 4) {
      productList.value = condimentList;
    }
  }
}
