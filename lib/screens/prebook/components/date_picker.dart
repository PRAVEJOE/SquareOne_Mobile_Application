import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Date_Picker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();

    DateTime _selectedValue = DateTime.now();

    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/birthday-cake.svg", "text": "Cakes"},
      {"icon": "assets/icons/nachos.svg", "text": "Snacks"},
      {"icon": "assets/icons/take-away.svg", "text": "Take Away"},
      {"icon": "assets/icons/food.svg", "text": "Packed Items"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(2)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenWidth(5),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 100,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  deactivatedColor: Colors.black12,
                  dateTextStyle: TextStyle(color: Colors.black, fontSize: 24),
                  inactiveDates: [
                    DateTime.now().add(Duration(days: 1)),
                    DateTime.now().add(Duration(days: 4)),
                    DateTime.now().add(Duration(days: 5))
                  ],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void setState(Null Function() param0) {}
}

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
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
