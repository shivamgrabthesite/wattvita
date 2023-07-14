// To parse this JSON data, do
//
//     final getToken = getTokenFromJson(jsonString);

import 'dart:convert';

GetToken getTokenFromJson(String str) => GetToken.fromJson(json.decode(str));

String getTokenToJson(GetToken data) => json.encode(data.toJson());

class GetToken {
  String accessToken;
  String refreshToken;

  GetToken({
    required this.accessToken,
    required this.refreshToken,
  });

  factory GetToken.fromJson(Map<String, dynamic> json) => GetToken(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
