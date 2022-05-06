import 'dart:convert';

ApiResponse responseFromJson(str) => ApiResponse.fromJson(str);

String responseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.message,
    this.id,
    this.affected,
  });

  final String message;
  final int? affected;
  final int? id;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        affected: json["affected"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "affected": affected,
        "id": id,
      };
}
