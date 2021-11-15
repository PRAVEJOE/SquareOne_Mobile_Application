import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

class CategorySelector_2 extends StatefulWidget {
  const CategorySelector_2({Key? key}) : super(key: key);

  @override
  _CategorySelector_2State createState() => _CategorySelector_2State();
}

class _CategorySelector_2State extends State<CategorySelector_2>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  List<Widget> list = [
    Tab(text: 'All'),
    Tab(text: 'Cakes'),
    Tab(text: 'Snacks'),
    Tab(text: 'TakeAway'),
  ];

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        print("api Index: " + _controller.index.toString());
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  final TreeController productController = Get.put(TreeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        SizedBox(height: 20.0),
        DefaultTabController(
            length: 4, // length of tabs
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
                        Expanded(
                          child: Obx(() {
                            if (productController.isLoading.value)
                              return Center(child: CircularProgressIndicator());
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
                        ),
                        Obx(() {
                          if (productController.isLoading.value)
                            return Center(child: CircularProgressIndicator());
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
                            return Center(child: CircularProgressIndicator());
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
                            return Center(child: CircularProgressIndicator());
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
