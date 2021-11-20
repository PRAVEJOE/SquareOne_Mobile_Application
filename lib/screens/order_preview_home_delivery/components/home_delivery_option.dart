import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../size_config.dart';
import 'home_delivery.dart';

class HomeDeliveryOption extends StatefulWidget {
  const HomeDeliveryOption({Key? key}) : super(key: key);

  @override
  _HomeDeliveryOptionState createState() => _HomeDeliveryOptionState();
}

List<String> _address = [
  "Keerthi House MRA TC 12/52,MULAVANA ROAD VANCHIYOOR P.O",
  "ADDRESS 1",
  "ADDRESS 2",
  "ADDRESS 3",
  "ADDRESS 4",
  "ADDRESS 5",
  "ADD NEW ADDRESS"
];

class _HomeDeliveryOptionState extends State<HomeDeliveryOption> {
  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
         // color: Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Column(children: [
        AddressSelector(data: _address, label: "Choose Delivery Address"),
        HomeDelivery()
      ]),
    );
  }
}

Icon _getDropdownIcon() {
  return Icon(
    Icons.unfold_more,
    color: Colors.blueAccent,
  );
}

class AddressSelector extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data;
  final String label;

  AddressSelector({required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.only(left: 4),
            child: Text(label)),
        Padding(
          padding: buttonPadding,
          child: Container(
            decoration: _getShadowDecoration(),
            child: Card(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Padding(
                        child: DirectSelectList<String>(
                          onUserTappedListener: () {
                            showToast("Hold and drag instead of tap",
                                context: context,
                                alignment: Alignment.center,
                                position: StyledToastPosition(
                                    align: Alignment.topCenter, offset: 20.0));
                          },
                          values: data,
                          defaultItemIndex: 0,
                          itemBuilder: (String value) =>
                              getDropDownMenuItem(value),
                          focusedItemDecoration: _getDslDecoration(),
                        ),
                        padding: EdgeInsets.only(left: 12))),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: _getDropdownIcon(),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.black,
    );
  }
}
