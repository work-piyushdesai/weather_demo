// To parse this JSON data, do
//
//     final searchHistoryListModel = searchHistoryListModelFromJson(jsonString);

import 'dart:convert';

SearchHistoryListModel searchHistoryListModelFromJson(String str) => SearchHistoryListModel.fromJson(json.decode(str));

String searchHistoryListModelToJson(SearchHistoryListModel data) => json.encode(data.toJson());

class SearchHistoryListModel {
  SearchHistoryListModel({
    this.searchHistoryDataModel,
  });

  List<SearchHistoryDataModel>? searchHistoryDataModel;

  factory SearchHistoryListModel.fromJson(Map<String, dynamic> json) => SearchHistoryListModel(
    searchHistoryDataModel: List<SearchHistoryDataModel>.from(json["search_history_data"].map((x) => SearchHistoryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "search_history_data": List<dynamic>.from(searchHistoryDataModel!.map((x) => x.toJson())),
  };
}

class SearchHistoryDataModel {
  SearchHistoryDataModel({
    this.id,
    this.name,
    this.type,
    this.profileImage,
  });

  String? id;
  String? name;
  String? type;
  String? profileImage;

  factory SearchHistoryDataModel.fromJson(Map<String, dynamic> json) => SearchHistoryDataModel(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    type: json["type"] ?? "",
    profileImage: json["profile_image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? "",
    "name": name ?? "",
    "type": type ?? "",
    "profile_image": profileImage ?? "",
  };
}
