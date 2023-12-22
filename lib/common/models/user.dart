class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'openId': open_id,
      'online': online,
    };
  }

  factory LoginRequestEntity.fromJson(Map<String, dynamic> map) {
    return LoginRequestEntity(
      type: map['type'] != null ? map['type'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      open_id: map['open_id'] != null ? map['open_id'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
    );
  }
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
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserProfile({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      access_token: json['access_token'],
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
      'accessToken': access_token,
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
