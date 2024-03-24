import 'package:dio/dio.dart';
import 'package:freelance/config/environment.dart';
import 'package:freelance/service/api/app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends DioMixin {
  static final ApiService _service = ApiService._internal();

  ApiService._internal() {
    options = BaseOptions(
      baseUrl: Environment.host,
      connectTimeout: Duration(seconds: Environment.apiTimeout),
    );
    interceptors.addAll([AppInterceptor(), PrettyDioLogger()]);
    httpClientAdapter = HttpClientAdapter();
  }

  factory ApiService() => _service;
}
