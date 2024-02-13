import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/domain/entities/token_response.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final _authHeaderKey = 'Authorization';

  TokenInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) print('onRequest TokenInterceptor ${options.uri}');

    try {
      TokenResponse? token = AuthService.to.token;

      if (token != null && options.headers['withToken'] != 'false') {
        options.headers[_authHeaderKey] = 'Bearer ${token.accessToken}';
      }

      handler.next(options);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (kDebugMode) print('onError TokenInterceptor ${err.requestOptions.uri}');

      await _refreshTokenAndRetry(err.requestOptions, handler);
    }

    handler.next(err);
  }

  Future<void> _refreshTokenAndRetry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      await AuthService.to.refreshToken();

      final Response response = await Dio().fetch(requestOptions);

      handler.resolve(response);
    } on DioException catch (e) {
      Fluttertoast.showToast(msg: "로그인 정보가 만료되었습니다. 다시 로그인해주세요.");
      await AuthService.to.logout();

      handler.reject(e);
    }
  }
}
