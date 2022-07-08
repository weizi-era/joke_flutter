import 'package:login_flutter/generated/json/base/json_convert_content.dart';
import 'package:login_flutter/bean/api_response.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
	final ApiResponse<T> apiResponse = ApiResponse();
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		apiResponse.data = data;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		apiResponse.msg = msg;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponse.code = code;
	}
	return apiResponse;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	return data;
}