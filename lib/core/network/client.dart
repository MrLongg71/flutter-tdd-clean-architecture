import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/server_exception.dart';
import 'app_header.dart';
import 'http.dart';

@singleton
class AppClient {
  AppHeader header = AppHeader();

  AppClient();

  set setHeader(AppHeader header) {
    this.header = header;
  }

  Future<Response<dynamic>> get(
      String url,
      {Map<String, dynamic>? queryParams, String? newToken}) async {
    final response = await dio.get(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return response;
  }

  Future<Response<dynamic>> post(
    String url, {
    dynamic body,
    String? contentType,
    String? newToken,
  }) async {
    final response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: header.toJson(),
        contentType: contentType ?? 'application/json; charset=utf-8',
      ),
    );
    return response;
  }

  Future<Response<dynamic>> put(String url, {dynamic body}) async {
    final response = await dio.put(
      url,
      data: body,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return response;
  }

  Future<Response<dynamic>> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    final response = await dio.delete(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return response;
  }

  Future<dynamic> getResponseFromApi({@required String? api}) async {
    try {
      final Response response = await Dio().get(api!);
      return json.decode(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
