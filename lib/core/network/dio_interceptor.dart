import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lizocommonwidgets/core/utils/snackbar_util.dart';

class DioInterceptor extends Interceptor {
  final Ref ref;
  final Future<String?> Function() getToken;

  DioInterceptor(this.ref, this.getToken);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    final token = await getToken();
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    print("###################################");
    print(response.data);
    print(response.statusCode);
    print("###################################");
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.requestOptions.path}',
    );

    print("###################################");

    print(err.response!.data);
    print(err.response!.statusCode);

    print("###################################");

    if ([401, 403, 422].contains(err.response?.statusCode)) {
      if (err.response?.statusCode == 422 || err.response?.statusCode == 401) {
        final errors = err.response?.data["errors"];
        if (errors is List) {
          ref.read(snackNotifierProvider).show(errors.join(", "));
        } else {
          ref.read(snackNotifierProvider).show(errors.first.toString());
        }
      }
    } else {
      ref
          .read(snackNotifierProvider)
          .show("Server unavailable, try again soon .");
    }

    super.onError(err, handler);
  }
}
