import 'package:login_flutter/generated/json/base/json_convert_content.dart';
import 'package:login_flutter/bean/joke.dart';

Joke $JokeFromJson(Map<String, dynamic> json) {
	final Joke joke = Joke();
	final JokeJoke? jokes = jsonConvert.convert<JokeJoke>(json['joke']);
	if (joke != null) {
		joke.joke = jokes;
	}
	final JokeInfo? info = jsonConvert.convert<JokeInfo>(json['info']);
	if (info != null) {
		joke.info = info;
	}
	final JokeUser? user = jsonConvert.convert<JokeUser>(json['user']);
	if (user != null) {
		joke.user = user;
	}
	return joke;
}

Map<String, dynamic> $JokeToJson(Joke entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['joke'] = entity.joke?.toJson();
	data['info'] = entity.info?.toJson();
	data['user'] = entity.user?.toJson();
	return data;
}

JokeJoke $JokeJokeFromJson(Map<String, dynamic> json) {
	final JokeJoke jokeJoke = JokeJoke();
	final double? jokesId = jsonConvert.convert<double>(json['jokesId']);
	if (jokesId != null) {
		jokeJoke.jokesId = jokesId;
	}
	final String? addTime = jsonConvert.convert<String>(json['addTime']);
	if (addTime != null) {
		jokeJoke.addTime = addTime;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		jokeJoke.content = content;
	}
	final double? userId = jsonConvert.convert<double>(json['userId']);
	if (userId != null) {
		jokeJoke.userId = userId;
	}
	final double? type = jsonConvert.convert<double>(json['type']);
	if (type != null) {
		jokeJoke.type = type;
	}
	final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
	if (imageUrl != null) {
		jokeJoke.imageUrl = imageUrl;
	}
	final bool? hot = jsonConvert.convert<bool>(json['hot']);
	if (hot != null) {
		jokeJoke.hot = hot;
	}
	final String? latitudeLongitude = jsonConvert.convert<String>(json['latitudeLongitude']);
	if (latitudeLongitude != null) {
		jokeJoke.latitudeLongitude = latitudeLongitude;
	}
	final String? showAddress = jsonConvert.convert<String>(json['showAddress']);
	if (showAddress != null) {
		jokeJoke.showAddress = showAddress;
	}
	final String? thumbUrl = jsonConvert.convert<String>(json['thumbUrl']);
	if (thumbUrl != null) {
		jokeJoke.thumbUrl = thumbUrl;
	}
	final String? videoUrl = jsonConvert.convert<String>(json['videoUrl']);
	if (videoUrl != null) {
		jokeJoke.videoUrl = videoUrl;
	}
	final double? videoTime = jsonConvert.convert<double>(json['videoTime']);
	if (videoTime != null) {
		jokeJoke.videoTime = videoTime;
	}
	final String? videoSize = jsonConvert.convert<String>(json['videoSize']);
	if (videoSize != null) {
		jokeJoke.videoSize = videoSize;
	}
	final String? imageSize = jsonConvert.convert<String>(json['imageSize']);
	if (imageSize != null) {
		jokeJoke.imageSize = imageSize;
	}
	final String? auditMsg = jsonConvert.convert<String>(json['audit_msg']);
	if (auditMsg != null) {
		jokeJoke.auditMsg = auditMsg;
	}
	return jokeJoke;
}

Map<String, dynamic> $JokeJokeToJson(JokeJoke entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['jokesId'] = entity.jokesId;
	data['addTime'] = entity.addTime;
	data['content'] = entity.content;
	data['userId'] = entity.userId;
	data['type'] = entity.type;
	data['imageUrl'] = entity.imageUrl;
	data['hot'] = entity.hot;
	data['latitudeLongitude'] = entity.latitudeLongitude;
	data['showAddress'] = entity.showAddress;
	data['thumbUrl'] = entity.thumbUrl;
	data['videoUrl'] = entity.videoUrl;
	data['videoTime'] = entity.videoTime;
	data['videoSize'] = entity.videoSize;
	data['imageSize'] = entity.imageSize;
	data['audit_msg'] = entity.auditMsg;
	return data;
}

JokeInfo $JokeInfoFromJson(Map<String, dynamic> json) {
	final JokeInfo jokeInfo = JokeInfo();
	final double? likeNum = jsonConvert.convert<double>(json['likeNum']);
	if (likeNum != null) {
		jokeInfo.likeNum = likeNum;
	}
	final double? shareNum = jsonConvert.convert<double>(json['shareNum']);
	if (shareNum != null) {
		jokeInfo.shareNum = shareNum;
	}
	final double? commentNum = jsonConvert.convert<double>(json['commentNum']);
	if (commentNum != null) {
		jokeInfo.commentNum = commentNum;
	}
	final double? disLikeNum = jsonConvert.convert<double>(json['disLikeNum']);
	if (disLikeNum != null) {
		jokeInfo.disLikeNum = disLikeNum;
	}
	final bool? isLike = jsonConvert.convert<bool>(json['isLike']);
	if (isLike != null) {
		jokeInfo.isLike = isLike;
	}
	final bool? isUnlike = jsonConvert.convert<bool>(json['isUnlike']);
	if (isUnlike != null) {
		jokeInfo.isUnlike = isUnlike;
	}
	final bool? isAttention = jsonConvert.convert<bool>(json['isAttention']);
	if (isAttention != null) {
		jokeInfo.isAttention = isAttention;
	}
	return jokeInfo;
}

Map<String, dynamic> $JokeInfoToJson(JokeInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['likeNum'] = entity.likeNum;
	data['shareNum'] = entity.shareNum;
	data['commentNum'] = entity.commentNum;
	data['disLikeNum'] = entity.disLikeNum;
	data['isLike'] = entity.isLike;
	data['isUnlike'] = entity.isUnlike;
	data['isAttention'] = entity.isAttention;
	return data;
}

JokeUser $JokeUserFromJson(Map<String, dynamic> json) {
	final JokeUser jokeUser = JokeUser();
	final double? userId = jsonConvert.convert<double>(json['userId']);
	if (userId != null) {
		jokeUser.userId = userId;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		jokeUser.nickName = nickName;
	}
	final String? signature = jsonConvert.convert<String>(json['signature']);
	if (signature != null) {
		jokeUser.signature = signature;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		jokeUser.avatar = avatar;
	}
	return jokeUser;
}

Map<String, dynamic> $JokeUserToJson(JokeUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['nickName'] = entity.nickName;
	data['signature'] = entity.signature;
	data['avatar'] = entity.avatar;
	return data;
}