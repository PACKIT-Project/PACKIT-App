import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:packit/domain/entities/packit_error_response.dart';

class ErrorInterceptor extends QueuedInterceptorsWrapper {
  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      if (kDebugMode) print('onError ErrorInterceptor ${err.requestOptions.uri}');

      PackitErrorResponse errorResponse = PackitErrorResponse.fromJson(err.response!.data);
      Fluttertoast.showToast(msg: "에러 발생!\n${errorResponse.message}(${errorResponse.errorCode})");
    }

    handler.next(err);
  }
}
