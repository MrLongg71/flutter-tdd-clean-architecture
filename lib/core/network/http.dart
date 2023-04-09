import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'config_network.dart';

Dio dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(milliseconds: ConfigNetwork.connectTimeout),
    receiveTimeout: const Duration(milliseconds: ConfigNetwork.responseTimeout),
    contentType: 'application/json; charset=utf-8',
    baseUrl: ConfigNetwork.apiUrl,
  ),
);


LogInterceptor logInterceptor = LogInterceptor(
  requestHeader: kDebugMode,
  requestBody: kDebugMode,
  responseBody: kDebugMode,
  responseHeader: false,
);
