class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? openId;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.openId,
    this.online,
  });
}

class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseEntity(
      code: json["code"],
      msg: json["msg"],
      data: UserProfile.fromJson(json["data"]),
    );
  }
}

// login result
class UserProfile {
  String? accessToken;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserProfile({
    this.accessToken,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      accessToken: json['accessToken'],
      token: json['token'],
      name: json['name'],
      description: json['description'],
      avatar: json['avatar'],
      online: json['online'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'token': token,
      'name': name,
      'description': description,
      'avatar': avatar,
      'online': online,
      'type': type,
    };
  }
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({
    required this.token,
    required this.name,
    required this.avatar,
    required this.description,
    required this.online,
  });
}
