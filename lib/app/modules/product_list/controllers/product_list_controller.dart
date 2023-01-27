import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/base/network/dio_extension.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/models/product_model.dart';
import 'package:test_implementation_codebase_flutter_rgb/data/network/services/product_services.dart';

import '../../../../base/network/json_api/base_response.dart';
import '../../../routes/app_pages.dart';

class ProductListController extends GetxController {
  final ProductServices _productServices;

  ProductListController(this._productServices);

  final int itemPerPageInitial = 8;
  final int itemPerPage = 4;
  int currentPage = 1;
  int maxPage = 100;

  CancelToken cancelToken = CancelToken();
  RxList<Data<Product>> data = RxList();

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

  Future<void> initList() async {
    try {
      final result = await _productServices.listProducts(cancelToken, currentPage, itemPerPage);
      incrementPage();
      data.addAll(result.data ?? []);
      loadMore();
    } catch (e){
      if (e is DioError){
        e.getFirstErrorResponse();
      }
    }
  }

  Future<void> loadMore() async {
    try {
      final result = await _productServices.listProducts(cancelToken, currentPage, itemPerPage);
      incrementPage();
      maxPage = result.meta?.totalPage ?? 20;
      data.addAll(result.data ?? []);
    } catch (e){
      if (e is DioError){
        e.getFirstErrorResponse();
      }
    }
  }

  void refreshList() {
    currentPage = 1;
    data.clear();
    initList();
  }

  Future<void> onWishlist(String productId) async {}

  void incrementPage() {
    currentPage++;
  }

  void resetPage() {
    currentPage = 1;
  }

  void toProductDetail(String productId) {
    Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"productId": productId});
  }

  void toCart() {
    Get.toNamed(Routes.CART);
  }
}
