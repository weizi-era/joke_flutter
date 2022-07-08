
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_flutter/constants/constants.dart';
import 'package:login_flutter/network/api_exception.dart';
import 'package:login_flutter/utils/DeviceInfoUtil.dart';

import '../bean/api_response.dart';

RequestClient requestClient = RequestClient();

class RequestClient {
  late Dio _dio;
  RequestClient() {
    _dio = Dio(BaseOptions(baseUrl: Constants.BASEURL, connectTimeout: Constants.CONNECTTIMEOUT));
  }

  Map<String, dynamic> defaultHeads = {
    "project_token": Constants.PROJECT_TOKEN,
    "channel": "cretin_open_api",
    "uk": DeviceInfoUtil.getDeviceIMEI(),
    "app": DeviceInfoUtil.getAppVersion(),
    "device": DeviceInfoUtil.getDeviceModel()
  };

  Future<dynamic> request(
      String url, {
        String method = "POST",
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool Function(ApiException)? onError,
      }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = defaultHeads;

      data = _convertRequestData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);

      return response.data;
    } catch(e) {
      var exception = ApiException.from(e);
      if(onError?.call(exception) != true){
        throw exception;
      }
    }

    return null;

  }

  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  ///请求响应内容处理
  T? _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data);
      return _handleBusinessResponse<T>(apiResponse);
    } else {
      return null;
    }
  }

  //业务内容处理
  T? _handleBusinessResponse<T>(ApiResponse<T> response) {
    if (response.code == Constants.SUCCESSCODE) {
      return response.data;
    } else {
      return null;
    }
  }

}

