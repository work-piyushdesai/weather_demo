// To parse this JSON data, do
//
//     final imageUploadResponse = imageUploadResponseFromJson(jsonString);

import 'dart:convert';

ImageUploadResponse imageUploadResponseFromJson(str) => ImageUploadResponse.fromJson(str);

String imageUploadResponseToJson(ImageUploadResponse data) => json.encode(data.toJson());

class ImageUploadResponse {
  ImageUploadResponse({
    this.message,
    this.contentType,
    this.url,
  });

  final String? message;
  final String? contentType;
  final String? url;

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) => ImageUploadResponse(
        message: json["message"],
        contentType: json["contentType"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "contentType": contentType,
        "url": url,
      };
}
