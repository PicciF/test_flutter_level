// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestResponse _$RestResponseFromJson(Map<String, dynamic> json) => RestResponse(
      count: (json['count'] as num?)?.toInt() ?? 0,
      result: json['result'],
      name: json['name'] as String? ?? "",
      category: json['category'] as String? ?? "",
    );

Map<String, dynamic> _$RestResponseToJson(RestResponse instance) {
  final val = <String, dynamic>{
    'count': instance.count,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('result', instance.result);
  val['category'] = instance.category;
  return val;
}
