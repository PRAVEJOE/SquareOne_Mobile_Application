import 'package:get/state_manager.dart';
import 'package:square_one_mobile_app/model/product.dart';
import 'package:square_one_mobile_app/screens/prebook/components/prebook_product.dart';
import 'package:square_one_mobile_app/screens/prebook/prebook_screen.dart';
import 'package:square_one_mobile_app/services/remote_services.dart';

class TreeController extends GetxController {

  var isLoading = true.obs;
  var productList = <TreeItemItem>[].obs;
  var ab=0;



  @override
  Future<void> onInit() async {
    fetchProducts();
    super.onInit();

  }
  void CategorySelected(int index) async {
    ab= index;
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
          if (ab == 1) {
            productList.value = products.data.treeItems[0].items;
            PreBookProducts();
          } else if (ab == 2) {
            productList.value = products.data.treeItems[7].items;
            PreBookProducts();
          }else if (ab == 3) {
            productList.value = products.data.treeItems[9].items;
            PreBookProducts();
          }else if (ab == 4) {
            productList.value = products.data.treeItems[10].items;
            PreBookProducts();
          }
      }finally {
      isLoading(false);
    }
  }
}
