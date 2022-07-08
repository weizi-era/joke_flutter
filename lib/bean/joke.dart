import 'package:login_flutter/generated/json/base/json_field.dart';
import 'package:login_flutter/generated/json/joke.g.dart';
import 'dart:convert';

@JsonSerializable()
class Joke {

	JokeJoke? joke;
	JokeInfo? info;
	JokeUser? user;
  
  Joke();

  factory Joke.fromJson(Map<String, dynamic> json) => $JokeFromJson(json);

  Map<String, dynamic> toJson() => $JokeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JokeJoke {

	double? jokesId;
	String? addTime;
	String? content;
	double? userId;
	double? type;
	String? imageUrl;
	bool? hot;
	String? latitudeLongitude;
	String? showAddress;
	String? thumbUrl;
	String? videoUrl;
	double? videoTime;
	String? videoSize;
	String? imageSize;
	@JSONField(name: "audit_msg")
	String? auditMsg;
  
  JokeJoke();

  factory JokeJoke.fromJson(Map<String, dynamic> json) => $JokeJokeFromJson(json);

  Map<String, dynamic> toJson() => $JokeJokeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JokeInfo {

	double? likeNum;
	double? shareNum;
	double? commentNum;
	double? disLikeNum;
	bool? isLike;
	bool? isUnlike;
	bool? isAttention;
  
  JokeInfo();

  factory JokeInfo.fromJson(Map<String, dynamic> json) => $JokeInfoFromJson(json);

  Map<String, dynamic> toJson() => $JokeInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class JokeUser {

	double? userId;
	String? nickName;
	String? signature;
	String? avatar;
  
  JokeUser();

  factory JokeUser.fromJson(Map<String, dynamic> json) => $JokeUserFromJson(json);

  Map<String, dynamic> toJson() => $JokeUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}