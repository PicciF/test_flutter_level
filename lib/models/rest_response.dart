// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'rest_response.g.dart';

@JsonSerializable(includeIfNull: false)
class RestResponse {
  int count;
  String name;
  dynamic result;
  String category;

  RestResponse({
    this.count = 0,
    this.result,
    this.name = "",
    this.category = "",
  });

  factory RestResponse.fromJson(Map<String, dynamic> json) => _$RestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestResponseToJson(this);
}
