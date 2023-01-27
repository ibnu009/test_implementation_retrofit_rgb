import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../resources/constant/network_constant.dart';
import '../response/error_response.dart';

class ErrorJsonApiResponseInterceptor extends Interceptor {
  final Function(DioError) onUnauthorized;
  final Function(DioError) onErrorException;

  ErrorJsonApiResponseInterceptor(
      {required this.onUnauthorized, required this.onErrorException});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.response) {
      DioError newError = getDioErrorMessageResponseTypeOnly(err);
      if (newError.message == "Unauthorized") {
        onUnauthorized(newError);
      } else {
        onErrorException(newError);
      }
    } else {
      onErrorException(getMessageExceptResponseType(err));
    }

    super.onError(err, handler);
  }
}

DioError getMessageExceptResponseType(DioError error) {
  String? newMessage;
  DioError newError =
      DioError(requestOptions: error.requestOptions, response: error.response);
  switch (error.type) {
    case DioErrorType.cancel:
      newMessage = NetworkMessageContants.genericErrorCancel.tr;
      break;
    case DioErrorType.connectTimeout:
      newMessage = NetworkMessageContants.genericErrorConnectTimeout.tr;
      break;
    case DioErrorType.other:
      newMessage = NetworkMessageContants.genericErrorNetwork.tr;
      break;
    case DioErrorType.receiveTimeout:
      newMessage = NetworkMessageContants.genericErrorReceiveTimeout.tr;
      break;
    case DioErrorType.sendTimeout:
      newMessage = NetworkMessageContants.genericErrorSendTimeout.tr;
      break;
    case DioErrorType.response:
      break;
  }
  newError.error = newMessage;
  return newError;
}

DioError getDioErrorMessageResponseTypeOnly(DioError error) {
  DioError newError =
      DioError(requestOptions: error.requestOptions, response: error.response);
  String? newMessage;
  if (error.response?.statusCode == -1 ||
      error.response?.statusCode != HttpStatus.serviceUnavailable) {
    try {
      ErrorResponse errorResponse =
      ErrorResponse.fromJson(error.response?.data);
      if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
        if (errorResponse.errors!.first.status == '401' ||
            errorResponse.errors!.first.detail == 'Unauthorized') {
          newMessage = "Unauthorized";
        } else {
          newMessage = errorResponse.errors!.first.detail;
        }
      } else {
        newMessage =
            '${NetworkMessageContants.genericError.tr} ${NetworkMessageContants.genericErrorBody.tr}';
      }
    } catch (e) {
      newMessage =
          '${NetworkMessageContants.genericError.tr} ${NetworkMessageContants.genericErrorBody.tr}';
    }
  } else if (error.response?.statusCode == HttpStatus.serviceUnavailable) {
    newMessage = NetworkMessageContants.genericErrorService.tr;
  }
  newError.error = newMessage;
  return newError;
}

