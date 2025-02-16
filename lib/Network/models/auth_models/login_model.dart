import 'dart:convert';

/// success : 1
/// message : "Login successfully"
/// data : {"userId":1,"userName":"Admin","phone":"1234567890","token":"","role":"Admin","createdDate":"2025-02-11T00:00:00.000Z","createdTime":"09:45:44"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsidXNlcklkIjoxLCJ1c2VyTmFtZSI6IkFkbWluIiwicGhvbmUiOiIxMjM0NTY3ODkwIiwidG9rZW4iOiIiLCJyb2xlIjoiQWRtaW4iLCJjcmVhdGVkRGF0ZSI6IjIwMjUtMDItMTFUMDA6MDA6MDAuMDAwWiIsImNyZWF0ZWRUaW1lIjoiMDk6NDU6NDQifSwiaWF0IjoxNzM5Njk5MDAxfQ.7K5FDlR2ko-ejeVchk4wK1ZYzLGRhDKEFFicG9jVoXg"

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    num? success,
    String? message,
    Data? data,
    String? token,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _token = token;
  }

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _token = json['token'];
  }
  num? _success;
  String? _message;
  Data? _data;
  String? _token;
  LoginModel copyWith({
    num? success,
    String? message,
    Data? data,
    String? token,
  }) =>
      LoginModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
        token: token ?? _token,
      );
  num? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

/// userId : 1
/// userName : "Admin"
/// phone : "1234567890"
/// token : ""
/// role : "Admin"
/// createdDate : "2025-02-11T00:00:00.000Z"
/// createdTime : "09:45:44"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? userId,
    String? userName,
    String? phone,
    String? token,
    String? role,
    String? createdDate,
    String? createdTime,
  }) {
    _userId = userId;
    _userName = userName;
    _phone = phone;
    _token = token;
    _role = role;
    _createdDate = createdDate;
    _createdTime = createdTime;
  }

  Data.fromJson(dynamic json) {
    _userId = json['userId'];
    _userName = json['userName'];
    _phone = json['phone'];
    _token = json['token'];
    _role = json['role'];
    _createdDate = json['createdDate'];
    _createdTime = json['createdTime'];
  }
  num? _userId;
  String? _userName;
  String? _phone;
  String? _token;
  String? _role;
  String? _createdDate;
  String? _createdTime;
  Data copyWith({
    num? userId,
    String? userName,
    String? phone,
    String? token,
    String? role,
    String? createdDate,
    String? createdTime,
  }) =>
      Data(
        userId: userId ?? _userId,
        userName: userName ?? _userName,
        phone: phone ?? _phone,
        token: token ?? _token,
        role: role ?? _role,
        createdDate: createdDate ?? _createdDate,
        createdTime: createdTime ?? _createdTime,
      );
  num? get userId => _userId;
  String? get userName => _userName;
  String? get phone => _phone;
  String? get token => _token;
  String? get role => _role;
  String? get createdDate => _createdDate;
  String? get createdTime => _createdTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['userName'] = _userName;
    map['phone'] = _phone;
    map['token'] = _token;
    map['role'] = _role;
    map['createdDate'] = _createdDate;
    map['createdTime'] = _createdTime;
    return map;
  }
}
