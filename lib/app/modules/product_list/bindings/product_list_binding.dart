import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/services/product_services.dart';

import '../controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    final ProductServices productServices = Get.find<ProductServices>();
    Get.lazyPut<ProductListController>(
      () => ProductListController(productServices),
    );
  }
}
