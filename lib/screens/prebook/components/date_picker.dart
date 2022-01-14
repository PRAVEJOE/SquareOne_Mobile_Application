import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

import '../../../size_config.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // final TreeController productController = Get.put(TreeController());
      // productController.slotDate();
    });
  }
  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();
    final TreeController productController = Get.put(TreeController());
      List<DateTime> preBookDateSlot = [];
      //final Datums prebookProduct;
      preBookDateSlot.clear();
      for (int i = 0; i < productController.prebookDateSlotList.length; i++) {
        var inputFormat = DateFormat('dd-MM-yyyy');
        var inputDate = inputFormat.parse(productController
            .prebookDateSlotList[i].days); // <-- dd/MM 24H format

        var outputFormat = DateFormat('yyyy-MM-dd');
        var outputDate = outputFormat.format(inputDate);
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(outputDate);
        preBookDateSlot.add(tempDate);
      }
      DateTime _selectedValue = productController.preBookDateSlotDate.first;
    //DateArrangement();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const Text(
            "Select a Date",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )),
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(4),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
          vertical: getProportionateScreenWidth(5),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DatePicker(
              productController.preBookDateSlotDate.first,
              width: 60,
              height: 100,
              // daysCount: productController.PreBookDate.length,
              controller: _controller,
              initialSelectedDate: productController.preBookDateSlotDate.first,
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              deactivatedColor: Colors.black12,
              dateTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
              activeDates: productController.preBookDateSlotDate,
              onDateChange: (date) {
                // New date selected
                _selectedValue = date;
                final DateTime now = date;
                final DateFormat formatter = DateFormat('yyyy-MM-dd');
                final String formatted = formatter.format(now);
                final TreeController _controllers = Get.put(TreeController());
                _controllers.listPrebookItemDate(formatted);
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ],
        ),
      )
    ]);
  }
}

class DateArrangement {}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
