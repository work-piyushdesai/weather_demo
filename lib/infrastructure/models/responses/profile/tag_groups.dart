import 'dart:convert';

List<TagGroups> tagGroupsFromJson(List json) => List<TagGroups>.from(json.map((x) => TagGroups.fromJson(x)));

String tagGroupsToJson(List<TagGroups> data) => json.encode(
      List<dynamic>.from(
        data.map((x) => x.toJson()),
      ),
    );

class TagGroups {
  TagGroups({
    this.id,
    this.name,
    this.values,
  });

  final int? id;
  final String? name;
  final List<Value>? values;

  factory TagGroups.fromJson(Map<String, dynamic> json) => TagGroups(
        id: json["id"],
        name: json["name"],
        values: json["values"] == null
            ? null
            : List<Value>.from(
                json["values"].map((x) => Value.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "values": values == null
            ? null
            : List<dynamic>.from(
                values!.map((x) => x.toJson()),
              ),
      };
}

class Value {
  Value({
    this.id,
    this.name,
    this.tagGroupId,
    this.count,
    this.multimedia,
  });

  final int? id;
  final String? name;
  final int? tagGroupId;
  final int? count;
  final String? multimedia;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        name: json["name"],
        tagGroupId: json["tagGroupId"],
        count: json["count"],
        multimedia: json["multimedia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagGroupId": tagGroupId,
        "count": count,
        "multimedia": multimedia,
      };
}
