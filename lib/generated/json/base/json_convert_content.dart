// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:login_flutter/bean/api_response.dart';
import 'package:login_flutter/bean/joke.dart';
import 'package:login_flutter/user_info.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(ApiResponse).toString(): ApiResponse.fromJson,
		(Joke).toString(): Joke.fromJson,
		(JokeJoke).toString(): JokeJoke.fromJson,
		(JokeInfo).toString(): JokeInfo.fromJson,
		(JokeUser).toString(): JokeUser.fromJson,
		(UserInfo).toString(): UserInfo.fromJson,
		(Data).toString(): Data.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<ApiResponse>[] is M){
			return data.map<ApiResponse>((Map<String, dynamic> e) => ApiResponse.fromJson(e)).toList() as M;
		}
		if(<Joke>[] is M){
			return data.map<Joke>((Map<String, dynamic> e) => Joke.fromJson(e)).toList() as M;
		}
		if(<JokeJoke>[] is M){
			return data.map<JokeJoke>((Map<String, dynamic> e) => JokeJoke.fromJson(e)).toList() as M;
		}
		if(<JokeInfo>[] is M){
			return data.map<JokeInfo>((Map<String, dynamic> e) => JokeInfo.fromJson(e)).toList() as M;
		}
		if(<JokeUser>[] is M){
			return data.map<JokeUser>((Map<String, dynamic> e) => JokeUser.fromJson(e)).toList() as M;
		}
		if(<UserInfo>[] is M){
			return data.map<UserInfo>((Map<String, dynamic> e) => UserInfo.fromJson(e)).toList() as M;
		}
		if(<Data>[] is M){
			return data.map<Data>((Map<String, dynamic> e) => Data.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}