import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../base/network/json_api/base_response.dart';
import '../../../resources/constant/services/product_constant.dart';
import '../models/product_model.dart';

part 'product_services.g.dart';

@RestApi()
abstract class ProductServices {
  factory ProductServices(Dio dio) = _ProductServices;

  @GET(ProductServiceConstant.listProducts)
  Future<BaseListResponse<Product>> listProducts(
      @CancelRequest() CancelToken cancelToken,
      @Query("page[number]") int currentPage,
      @Query("page[size]") int pageSize);

  @GET(ProductServiceConstant.productDetail)
  Future<BaseResponse<Product>> productDetail(
      @CancelRequest() CancelToken cancelToken,
      @Path() String productId);
}
