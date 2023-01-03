import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.identifier,
    required this.password,
    required this.invalidateOtherSessions,
    required this.firebaseToken,
    required this.data,
    required this.refreshTokenDurationInSeconds,
  });

  String identifier;
  String password;
  bool invalidateOtherSessions;
  String firebaseToken;
  List<Data> data;
  int refreshTokenDurationInSeconds;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    identifier: json["identifier"],
    password: json["password"],
    invalidateOtherSessions: json["invalidateOtherSessions"],
    firebaseToken: json["firebaseToken"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    refreshTokenDurationInSeconds: json["refreshTokenDurationInSeconds"],
  );

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "password": password,
    "invalidateOtherSessions": invalidateOtherSessions,
    "firebaseToken": firebaseToken,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "refreshTokenDurationInSeconds": refreshTokenDurationInSeconds,
  };
}

class Data {
  Data({
    required this.name,
    required this.value,
  });

  String name;
  String value;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}
