import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:square_one_mobile_app/components/product_card_api.dart';
import 'package:square_one_mobile_app/controllers/tree_controller.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  List<Tab> myTabs = <Tab>[
    Tab(text: 'loading...'),
  ];
  final TreeController productController = Get.put(TreeController());

  // ↓ Constructor can now take myTabs argument
  MyTabController({myTabs}) {
    this.myTabs;
  }

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    asyncLoadTabs();
  }

  // Fake 2 sec. async call
  void asyncLoadTabs({int index = 0}) async {
    await Future.delayed(Duration(milliseconds: 5), () {
      myTabs = <Tab>[
        Tab(text: 'loading...'),
      ];
      myTabs.clear();
      for (int i = 0; i < productController.categoryPreBook.length; i++) {
        if (productController.categoryPreBook.length > 0) {
          myTabs.add(Tab(text: productController.categoryPreBook[i]));
        }
      }
      controller.dispose(); // release animation resources
      // recreate TabController as length is final/cannot change ↓
      controller = TabController(
          vsync: this,
          length: myTabs.length,
          initialIndex: index // to show a particular tab on create
          );
      update();
      // ↑ rebuilds GetBuilder widget with latest controller data
    });
  }

  void switchTab(int index) async {
    productController.categorySelected(
        index, productController.categoryPreBook[index]);
    print(index);
    asyncLoadTabs(index: index);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class MyTabbedWidget extends StatefulWidget {
  @override
  State<MyTabbedWidget> createState() => _MyTabbedWidgetState();
}

final TreeController productController = Get.put(TreeController());

class _MyTabbedWidgetState extends State<MyTabbedWidget> {
  @override
  Widget build(BuildContext context) {
    // ↓ use GetBuilder & rebuild using update()
    return Obx(() {
      if (productController.categoryIsLoading.value) {
        return Center(
            child: SpinKitWave(
          color: Colors.black,
          size: 50.0,
        ));
      } else {
        return GetBuilder<MyTabController>(
          init: MyTabController(),
          builder: (_tabx) => Column(children: [
            TabBar(
              controller: _tabx.controller,
              tabs: _tabx.myTabs,
              onTap: _tabx.switchTab,
              labelColor: Colors.black, // receives tab # on tab click
            ),
            Expanded(
              child: Obx(() {
                if (productController.productIsLoading.value) {
                  return Center(
                      child: SpinKitWave(
                    color: Colors.black,
                    size: 50.0,
                  ));
                } else {
                  return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabx.controller,
                    children: _tabx.myTabs.map<Widget>((Tab tab) {
                      if (productController.productList.isNotEmpty) {
                        return StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          itemCount: productController.productList.length,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          itemBuilder: (context, index) {
                            return ProductCardAPI(
                                productController.productList[index]);
                          },
                          staggeredTileBuilder: (index) =>
                              const StaggeredTile.fit(1),
                        );
                      } else {
                        return const Image(
                            image: AssetImage(
                                'assets/images/no-item-found-here.png'));
                      }
                    }).toList(),
                  );
                }
              }),
            )
          ]),
        );
      }
    });
  }
}
