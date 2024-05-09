// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  @JsonKey(defaultValue: "")
  String username;

  User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
