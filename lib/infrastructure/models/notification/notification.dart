import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

Notification notificationFromJson(String str) =>
    Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
  Notification({
    String? userName,
    String? userImage,
    String? reactionType,
    List<String>? communityNames,
    String? description,
    int? totalCount,
    String? activityId,
    String? time,
    String? postId,
    bool? isSeen,
  }) {
    _userName = userName;
    _userImage = userImage;
    _reactionType = reactionType;
    _communityNames = communityNames;
    _description = description;
    _totalCount = totalCount;
    _activityId = activityId;
    _time = time;
    _postId = postId;
    _isSeen = isSeen;
  }

  Notification.fromJson(dynamic json) {
    _userName = json['user_name'];
    _userImage = json['user_image'];
    _reactionType = json['reaction_type'];
    _communityNames = json['community_names'] != null
        ? json['community_names'].cast<String>()
        : [];
    _description = json['description_one'];
    _descriptionTwo = json['description_two'];
    _totalCount = json['total_count'];
    _activityId = json['activity_id'];
    _postId = json['post_id'];
    _time = json['time'];
    _isSeen = json['is_seen'];
  }

  String? _userName;
  String? _userImage;
  String? _reactionType;
  List<String>? _communityNames;
  String? _description;
  String? _descriptionTwo;
  int? _totalCount;
  String? _activityId;
  String? _time;
  String? _postId;
  bool? _isSeen;
  final RxBool _isSelected = false.obs;

  String? get userName => _userName;

  String? get userImage => _userImage;

  String? get reactionType => _reactionType;

  List<String>? get communityNames => _communityNames;

  String? get description => _description;

  String? get descriptionTwo => _descriptionTwo;

  int? get totalCount => _totalCount;

  String? get activityId => _activityId;

  String? get postId => _postId;

  String? get time => _time;

  bool? get isSeen => _isSeen;

  RxBool get isSelected => _isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = _userName;
    map['user_image'] = _userImage;
    map['reaction_type'] = _reactionType;
    map['community_names'] = _communityNames;
    map['description'] = _description;
    map['total_count'] = _totalCount;
    map['activity_id'] = _activityId;
    map['time'] = _time;
    map['post_id'] = _postId;
    map['is_seen'] = _isSeen;
    return map;
  }
}
