import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:square_one_mobile_app/screens/home/components/section_title.dart';
import 'section_title.dart';
import '../../../size_config.dart';

class Date_Picker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();

    DateTime _selectedValue = DateTime.now();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Text(
            "Select a Date",textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
            ),
        )
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),getProportionateScreenWidth(4),getProportionateScreenWidth(20),getProportionateScreenWidth(20)),
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
                daysCount: 10,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.black12,
                dateTextStyle: TextStyle(color: Colors.black, fontSize: 24),
                inactiveDates: [
                  DateTime.now().add(Duration(days: 1)),
                  DateTime.now().add(Duration(days: 4)),
                  DateTime.now().add(Duration(days: 4))
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
      )
    ]);
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
