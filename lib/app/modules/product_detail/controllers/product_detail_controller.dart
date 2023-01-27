import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/base/network/dio_extension.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/models/product_model.dart';
import 'package:test_implementation_codebase_flutter_rgb/utils/extention/context_ext.dart';

import '../../../../data/network/services/product_services.dart';
import '../../../component/dialog/loading_dialog.dart';

class ProductDetailController extends GetxController {

  final ProductServices _productServices;

  ProductDetailController(this._productServices);

  final _arguments = Get.arguments;

  String get productId => _arguments["productId"];
  CancelToken cancelToken = CancelToken();

  Rx<Product?> product = Rx(null);

  RxBool isExpanded = false.obs;
  RxBool isWishList = false.obs;
  RxBool isProductAddedToCart = false.obs;

  RxInt quantity = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> initProductDetail() async {
   try {
      final result = await _productServices.productDetail(cancelToken, productId);
      isWishList.value = result.data?.attributes.isWishlist == 1;
      product.value = result.data?.attributes;
    } catch (e){
      if (e is DioError){
        e.getFirstErrorResponse();
      }
    }
  }

  void onSeeMoreDescription() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  Future<void> onWishlist() async {
    isWishList.value = !isWishList.value;
    update();
  }

  void addQuantity() {
    quantity.value++;
    update();
  }

  void detractQuantity() {
    if (quantity.value == 0) return;
    quantity.value--;
    update();
  }

  void addToCart(BuildContext context) {
    if (isProductAddedToCart.value) {
      isProductAddedToCart.value = false;
      context.showSnackBar('Berhasil dihapus dari cart');
      update();
      return;
    }
    isProductAddedToCart.value = true;
    context.showSnackBar('Berhasil ditambahkan ke cart');
    update();
  }

  Future<void> redeemProduct(BuildContext context) async {
    if (quantity.value.isEqual(0)) {
      showWarningDialog(
          context: context,
          title: 'Perhatian',
          message: 'Kamu belum menambahkan jumlah produk');
      return;
    }

    showLoadingDialog(context: context, loadingText: 'Redeeming gift..');
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
  }
}
