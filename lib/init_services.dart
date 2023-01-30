import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_implementation_codebase_flutter_rgb/base/network/dio_extension.dart';

import 'base/network/interceptor/authorization_header_interceptor.dart';
import 'base/network/interceptor/error_json_api_response_interceptor.dart';
import 'base/network/interceptor/platform_header_interceptor.dart';
import 'base/network/interceptor/pretty_dio_logger_interceptor.dart';
import 'data/network/services/product_services.dart';
import 'resources/constant/remote_constant.dart';

Future<void> initServices() async {
  await Get.putAsync(() async => Dio()
    .addBaseUrl(RemoteConstants.baseStagingURL)
    .addInterceptor(ErrorJsonApiResponseInterceptor(onErrorException: (e) {
   
    }, onUnauthorized: (e) {
      //destroy session & redirect to page unauthorized
    }))
    .addInterceptor(AuthorizationHeaderInterceptor(
        onToken: () async => "your")
      )
    .addInterceptor(PlatformHeaderInterceptor())
    .addInterceptor(PrettyDioLoggerInterceptor()));

  await Get.putAsync(() async => ProductServices(Get.find<Dio>()));
}
