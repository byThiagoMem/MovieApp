import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'api_constants.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('REQUEST[${options.method}] => PATH: ${options.path}');

    options.queryParameters.addAll(
      {
        'api_key': FirebaseRemoteConfig.instance.getString('api_key'),
        'language': ApiConfigurations.language,
      },
    );

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    switch (err.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.sendTimeout:
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.response:
        break;
      case DioErrorType.other:
        break;
      default:
    }
    return super.onError(err, handler);
  }
}
