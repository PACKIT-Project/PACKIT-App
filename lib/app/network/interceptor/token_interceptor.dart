import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:packit/app/service/auth_service.dart';
import 'package:packit/domain/entities/login_response.dart';
import 'package:packit/domain/entities/packit_error_response.dart';
import 'package:packit/domain/entities/packit_response.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  final _authHeaderKey = 'Authorization';

  TokenInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) print('onRequest TokenInterceptor ${options.uri}');

    try {
      PackitResponse<LoginResponse>? response = AuthService.to.loginResponse;

      if (response != null) {
        options.headers[_authHeaderKey] = 'Bearer ${response.data.accessToken}';
      }

      handler.next(options);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) print('onError TokenInterceptor ${err.requestOptions.uri}');

    PackitErrorResponse errorResponse = PackitErrorResponse.fromJson(err.response!.data);
    Fluttertoast.showToast(msg: "에러 발생!\n${errorResponse.message}(${errorResponse.errorCode})");

    handler.next(err);
  }
}
