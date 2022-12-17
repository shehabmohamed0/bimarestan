import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator/locator.dart';
import '../resources/strings_manager.dart';

class DioFactory {
  static Dio? _dio;

  DioFactory._();

  static Dio get dio {
    _dio ??= _getHttpClient();

    return _dio!;
  }
}

Dio _getHttpClient() {
  return HttpBuilder(
    Dio(
      BaseOptions(
        baseUrl: AppStrings.apiURL,
      ),
    ),
  ).instance();
}

class HttpBuilder {
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  final Dio _dio;

  HttpBuilder(this._dio);

  Dio instance() {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // final token = _sharedPreferences.getString('token');
       
          // options.headers['Content-Language'] = Localizations.localeOf(
          //   StackedService.navigatorKey!.currentContext!,
          // ).languageCode;

          handler.next(options);
        },
        onError: (err, handler) {
          handler.next(err);
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    return _dio;
  }
}
