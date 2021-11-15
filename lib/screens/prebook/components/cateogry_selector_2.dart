import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

class CategorySelector_2 extends StatefulWidget {
    CategorySelector_2(this.selectedIndex, {Key? key}) : super(key: key);
    late final int selectedIndex;

  @override
  _CategorySelector_2State createState() => _CategorySelector_2State();
}

class _CategorySelector_2State extends State<CategorySelector_2>
    with SingleTickerProviderStateMixin {
  String dateReturned = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String prebookTime = "10:00 AM";
  String timeReturned = "10:00 AM";
  int _preSelectedTab=0;
  late TabController _controller;
  int _selectedIndex = 0;
  List<Widget> list = [
    Tab(text: 'All'),
    Tab(text: 'Cakes'),
    Tab(text: 'Snacks'),
    Tab(text: 'TakeAway'),
    Tab(text: 'Condiments'),
  ];
  @override
  void initState() {
    super.initState();

    // Create TabController for getting the index of current tab
    //_selectedIndex
    _controller = TabController(length: list.length, vsync: this, initialIndex:widget.selectedIndex );
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        widget.selectedIndex=_selectedIndex;
        print("api Index: " + _controller.index.toString());
        final TreeController _controllers = Get.put(TreeController());
        _controllers.CategorySelected(_selectedIndex);
      });

      final TreeController _controllers = Get.put(TreeController());
      _controllers.CategorySelected(_selectedIndex);
      print("Selected Index: " + _controller.index.toString());
    });
  }

  final TreeController productController = Get.put(TreeController());


  void listprebookItemDate(String index) async {
    dateReturned = index;
  }

  void listprebookItemTime(String index) async {
    timeReturned = index;
  }
  void CategorySelected(int selectedCat) async{
     _preSelectedTab = selectedCat;
     print(_preSelectedTab);
  }

  @override
  Widget build(BuildContext context) {
    final TreeController _controllers = Get.put(TreeController());
    _controllers.CategorySelected(widget.selectedIndex);
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        SizedBox(height: 20.0),
        DefaultTabController(
            length: 5, // length of tabs
            initialIndex: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      onTap: (index) {
                        // Should not used it as it only called when tab options are clicked,
                        // not when user swapped
                        final TreeController _controllers =
                            Get.put(TreeController());
                        _controllers.CategorySelected(index);
                      },
                      isScrollable: true,
                      controller: _controller,
                      tabs: list,
                      labelColor: Colors.black,
                    ),
                  ),
                  Container(
                      height: 400, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(controller: _controller, children: [

                           Obx(() {
                            if (productController.isLoading.value)
                              return  Center(child: SpinKitSpinningLines(
                              color: Colors.black,
                              size: 50.0,
                            ));
                            else
                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: productController.productList.length,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              itemBuilder: (context, index) {
                                return ProductCardAPI(
                                    productController.productList[index]);
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                            );
                          }),

                        Obx(() {
                          if (productController.isLoading.value)
                            return Center(child: SpinKitSpinningLines(
                            color: Colors.black,
                            size: 50.0,
                          ));
                          else
                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: productController.productList.length,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            itemBuilder: (context, index) {
                              return ProductCardAPI(
                                  productController.productList[index]);
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          );
                        }),
                        Obx(() {
                          if (productController.isLoading.value)
                            return Center(child: SpinKitSpinningLines(
                              color: Colors.black,
                              size: 50.0,
                            ));
                          else
                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: productController.productList.length,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            itemBuilder: (context, index) {
                              return ProductCardAPI(
                                  productController.productList[index]);
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          );
                        }),
                        Obx(() {
                          if (productController.isLoading.value)
                            return Center(child: SpinKitSpinningLines(
                              color: Colors.black,
                              size: 50.0,
                            ));
                          else
                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: productController.productList.length,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              itemBuilder: (context, index) {
                                return ProductCardAPI(
                                    productController.productList[index]);
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                            );
                        }),
                        Obx(() {
                          if (productController.isLoading.value)
                            return Center(child: SpinKitSpinningLines(
                              color: Colors.black,
                              size: 50.0,
                            ));
                          else
                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: productController.productList.length,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              itemBuilder: (context, index) {
                                return ProductCardAPI(
                                    productController.productList[index]);
                              },
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.fit(1),
                            );
                        }),
                      ]))
                ])),
      ]),
    );
  }
}
