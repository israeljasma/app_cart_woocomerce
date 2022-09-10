import 'dart:convert';

class LoginResponse {
  bool success;
  int statusCcode;
  String code;
  String message;
  Data data;

  LoginResponse({
    required this.success,
    required this.statusCcode,
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        success: json['success'],
        statusCcode: json['statusCcode'],
        code: json['code'],
        message: json['message'],
        data: Data.fromMap(json["dates"]),
      );
}

class Data {
  String token;
  int id;
  String email;
  String nickname;
  String fisrtName;
  String lastName;
  String displayName;

  Data({
    required this.token,
    required this.id,
    required this.email,
    required this.nickname,
    required this.fisrtName,
    required this.lastName,
    required this.displayName,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json['token'],
        id: json['id'],
        email: json['email'],
        nickname: json['nickname'],
        fisrtName: json['fisrtName'],
        lastName: json['lastName'],
        displayName: json['displayName'],
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['token'] = token;
  //   data['id'] = id;
  //   data['email'] = email;
  //   data['nickname'] = nickname;
  //   data['fisrtName'] = fisrtName;
  //   data['lastName'] = lastName;
  //   data['displayName'] = displayName;

  //   return data;
  // }
}
