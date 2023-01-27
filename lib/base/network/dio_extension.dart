import 'package:dio/dio.dart';

import 'response/error_response.dart';

extension DioExtention on Dio {
  Dio addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
    return this;
  }

  Dio addBaseUrl(String baseUrl) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    return this;
  }

  Future<T> getWith<T>(
    String url,
    Map<String, dynamic>? params,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await get(url, queryParameters: params);
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<T> postWith<T>(
    String url,
    dynamic data,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await post(url, data: data);
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

extension DioErrorExtention on DioError {
  ErrorResponse? getErrorResponse() {
    try {
      return ErrorResponse.fromJson(response?.data);
    } catch (error) {
      return null;
    }
  }


  ErrorItem? getFirstErrorResponse() {
    try {
      ErrorResponse errorResponse =  ErrorResponse.fromJson(this.response?.data);
      if((errorResponse.errors ?? []).isNotEmpty){
        return (errorResponse.errors ?? [])[0];
      }
    } catch (error) {
        //
    }
     return null;
  }
}
