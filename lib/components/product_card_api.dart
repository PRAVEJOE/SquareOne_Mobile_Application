import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:square_one_mobile_app/components/rounded_icon_btn_style_2.dart';
import 'package:square_one_mobile_app/controllers/item_Controller.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';
import 'package:square_one_mobile_app/model/PrebookProduct.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCardAPI extends StatefulWidget {
  final PrebookItem treeItemItem;

  const ProductCardAPI(this.treeItemItem, {Key? key}) : super(key: key);

  @override
  _ProductCardAPIState createState() => _ProductCardAPIState();
}

final ItemController itemController = Get.put(ItemController());
final TreeController productController = Get.put(TreeController());

class _ProductCardAPIState extends State<ProductCardAPI> {
  String? caption;

  final TextEditingController _controller = TextEditingController();

  void add() {
    setState(() {
      widget.treeItemItem.quantity++;
      final TreeController _controllers = Get.put(TreeController());
      if (widget.treeItemItem.quantity == 0) {
        showToast(
            "Sorry !!! Add at least one quantity to the ${widget.treeItemItem
                .displayName}",
            context: context,
            alignment: Alignment.center,
            position: const StyledToastPosition(
                align: Alignment.topCenter, offset: 20.0));
      } else {
        itemController.addProductToCart(widget.treeItemItem);
      }
      if (kDebugMode) {
        print(widget.treeItemItem);
      }
      itemController.totalamount();
    });
  }

  void minus() {
    setState(() {
      if (widget.treeItemItem.quantity != 0) widget.treeItemItem.quantity--;
      final TreeController _controllers = Get.put(TreeController());
      if (widget.treeItemItem.quantity == 0) {
        widget.treeItemItem.quantity = 0;
        widget.treeItemItem.uniqueID = "";
        itemController.removeProductFromCart(widget.treeItemItem);

        showToast(
            "Sorry !!! Add at least one quantity to the ${widget.treeItemItem
                .displayName}",
            context: context,
            alignment: Alignment.center,
            position: const StyledToastPosition(
                align: Alignment.topCenter, offset: 20.0));
      } else {
        itemController.addProductToCart(widget.treeItemItem);
      }
      if (kDebugMode) {
        print(widget.treeItemItem);
      }
      itemController.totalamount();
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: Badge(
          position: BadgePosition.topEnd(top: -7, end: -5),
          badgeColor: Colors.red,
          showBadge: (widget.treeItemItem.quantity > 0),
          toAnimate: true,
          animationType: BadgeAnimationType.slide,
          shape: BadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          badgeContent: Container(
            width: 50,
            height: 20,
            alignment: Alignment.center,
            child: Text(
              'Added',
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // child: Hero(
                    //   tag: widget.treeItemItem.itemId.toString(),
                    //   child: Image.asset(widget.treeItemItem.i[0]),
                    // ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.treeItemItem.displayName,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (widget.treeItemItem.quantity > 0)
                        ? Text.rich(TextSpan(
                      text: "₹${widget.treeItemItem.unitPrice}\n",
                      style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                          "item total: ${double.tryParse(
                              widget.treeItemItem.unitPrice)! *
                              widget.treeItemItem.quantity} ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ))
                        : Text("₹${widget.treeItemItem.unitPrice}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(TextSpan(
                      text: "WTY:\n",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        (double.tryParse(widget.treeItemItem.itemWtForHd)! < 1)
                            ? TextSpan(
                          text:
                          "${double.tryParse(widget.treeItemItem.itemWtForHd)! *
                              1000} Gm",
                          style:
                          TextStyle(fontSize: 10, color: Colors.black),
                        )
                            : TextSpan(
                          text: "${widget.treeItemItem.itemWtForHd} Kg",
                          style:
                          TextStyle(fontSize: 10, color: Colors.black),
                        )
                      ],
                    )),
                    const Spacer(),
                    RoundedIconBtnStyle2(
                      icon: Icons.remove,
                      showShadow: true,
                      press: () {
                        minus();
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Text("${widget.treeItemItem.quantity} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    RoundedIconBtnStyle2(
                        icon: Icons.add,
                        showShadow: true,
                        press: () {
                          add();
                        }),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  penAlertBox() {
    var myColor = kPrimaryColor;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.treeItemItem.productName,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: TextFormField(
                        key: _formKey,
                        autofocus: true,
                        minLines: 1,
                        maxLines: 5,
                        initialValue: widget.treeItemItem.caption,
                        onSaved: (newValue) => caption = newValue!,
                        onChanged: (value) {
                          widget.treeItemItem.caption = value;
                          caption = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your Caption",
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}