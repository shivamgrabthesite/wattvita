// To parse this JSON data, do
//
//     final postReg = postRegFromJson(jsonString);

import 'dart:convert';

PostReg postRegFromJson(String str) => PostReg.fromJson(json.decode(str));

String postRegToJson(PostReg data) => json.encode(data.toJson());

class PostReg {
  bool success;
  Data data;

  PostReg({
    required this.success,
    required this.data,
  });

  factory PostReg.fromJson(Map<String, dynamic> json) => PostReg(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String id;

  Data({
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
