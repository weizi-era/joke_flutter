import 'package:login_flutter/generated/json/base/json_field.dart';
import 'package:login_flutter/generated/json/api_response.g.dart';
import 'dart:convert';

@JsonSerializable()
class ApiResponse<T> {

	T? data;
	String? msg;
	int? code;
  
  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}