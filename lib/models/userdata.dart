// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String id;
  String name;
  String phone;
  String role;
  DateTime createdAt;
  String email;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "email": email,
      };
}
