
import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/services/product_services.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    final ProductServices productServices = Get.find<ProductServices>();

    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(productServices),
    );
  }
}
