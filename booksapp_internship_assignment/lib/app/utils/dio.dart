import 'package:dio/dio.dart';

class DioHelper {
  static Dio init() {
    final option = BaseOptions(
      //baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      contentType: Headers.formUrlEncodedContentType,
    );

    final interceptors = InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioException e, handler) async {
      return handler.next(e);
    });

    final dio = Dio(option);

    dio.interceptors.add(interceptors);

    return dio;
  }
}