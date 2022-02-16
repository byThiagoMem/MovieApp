import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';
import 'dio_interceptor.dart';

class DioClient {
  DioClient();

  Dio get dio => _getDio();

  Dio _getDio() {
    var options = BaseOptions(
      baseUrl: ApiConfigurations.baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    var dio = Dio(options);
    dio.interceptors.addAll([DioInterceptor(), PrettyDioLogger()]);
    return dio;
  }
}
