import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  String test = "Implementation Codebase Flutter";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _toProductList();
  }

  @override
  void onClose() {}

  Future<void> _toProductList() async{
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.PRODUCT_LIST);
  }
}
