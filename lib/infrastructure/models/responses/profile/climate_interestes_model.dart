import 'dart:convert';

List<ClimateInterestsModel> climateInterestModelFromJson(List json) =>
    List<ClimateInterestsModel>.from(
        json.map((x) => ClimateInterestsModel.fromJson(x)));

String climateInterestModelToJson(List<ClimateInterestsModel> data) =>
    json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class ClimateInterestsModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? sRawPath;
  String? sectorId;
  String? serverId;
  String? sectorImage;
  String? sectorName;

  ClimateInterestsModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.sRawPath,
      this.sectorId,
      this.serverId,
      this.sectorImage,
      this.sectorName});

  ClimateInterestsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sRawPath = json['_rawPath'];
    sectorId = json['sector_id'];
    serverId = json['server_id'];
    sectorImage = json['sector_image'];
    sectorName = json['sector_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['_rawPath'] = sRawPath;
    data['sector_id'] = sectorId;
    data['server_id'] = serverId;
    data['sector_image'] = sectorImage;
    data['sector_name'] = sectorName;
    return data;
  }
}
