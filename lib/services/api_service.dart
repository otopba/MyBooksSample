import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mybooks/data/models/serializers.dart';
import 'package:mybooks/data/models/server/books_result.dart';
import 'package:mybooks/data/models/server/error_result.dart';
import 'package:mybooks/data/models/server/register_result.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/services/preferences_service.dart';
import 'package:mybooks/utils/texts.dart';

const _tag = 'api_service';

class ApiService {
  ApiService({required this.prefs}) {
    _init();
  }

  static const _baseUrl = 'http://104.248.26.141:3000/api';
  static const _registerPath = '/auth/register';
  static const _loginPath = '/auth/login';
  static const _booksPath = '/books';
  final PreferencesService prefs;
  late final Dio _dio;

  void _init() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      validateStatus: (status) => status != 500,
    );
    _dio = Dio(options);
    if (!kReleaseMode) {
      _dio.interceptors.add(LogInterceptors());
    }
  }

  Future<RegisterResult> register({
    required String username,
    required String password,
  }) async {
    return request(
      path: _registerPath,
      method: "POST",
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  Future<RegisterResult> login({
    required String username,
    required String password,
  }) async {
    return request(path: _loginPath, method: "POST", data: {
      'username': username,
      'password': password,
    });
  }

  Future<BooksResult> books({
    String? query,
  }) async {
    return request(
      path: _booksPath,
      method: "GET",
      queryParameters: query.isNotNullOrEmpty ? {'q': query} : null,
      headers: {'Authorization': 'Bearer ${prefs.getToken()}'},
    );
  }

  Future<T> request<T>({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final result = await _dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method,
        headers: headers,
      ),
    );

    if (result.statusCode == 200) {
      try {
        final parsed = deserialize<T>(result.data);
        if (parsed == null) {
          return Future.error("");
        } else {
          return parsed;
        }
      } catch (e, stackTrace) {
        Log.e(_tag, "Can't parse result: $e", stackTrace: stackTrace);
        return Future.error("");
      }
    }

    try {
      final parsed = deserialize<ErrorResult>(result.data);
      if (parsed == null) {
        return Future.error("");
      } else {
        return Future.error(parsed.message);
      }
    } catch (e, stackTrace) {
      Log.e(_tag, "Can't parse error: $e", stackTrace: stackTrace);
      return Future.error("");
    }
  }
}

class LogInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.d(_tag, 'REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d(
      _tag,
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.d(
      _tag,
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
