// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map<String, dynamic> json) => Specie(
      taxonId: (json['taxonid'] as num?)?.toInt() ?? 0,
      scientificName: json['scientific_name'] as String? ?? '',
      subspecies: json['subspecies'] as String? ?? '',
      rank: json['rank'] as String? ?? '',
      subpopulation: json['subpopulation'] as String? ?? '',
      kingdom: json['kingdom'] as String? ?? '',
      phylum: json['phylum'] as String? ?? '',
      classification: json['class'] as String? ?? '',
      order: json['order'] as String? ?? '',
      family: json['family'] as String? ?? '',
      genus: json['genus'] as String? ?? '',
      mainCommonName: json['main_common_name'] as String? ?? '',
      authority: json['authority'] as String? ?? '',
      publishedYear: (json['published_year'] as num?)?.toInt() ?? 0,
      assessmentDate: json['assessment_date'] == null
          ? null
          : DateTime.parse(json['assessment_date'] as String),
      category: json['category'] as String? ?? '',
      criteria: json['criteria'] as String? ?? '',
      populationTrend: json['population_trend'] as String? ?? '',
      marineSystem: json['marine_system'] as bool? ?? false,
      freshwaterSystem: json['freshwater_system'] as bool? ?? false,
      terrestrialSystem: json['terrestrial_system'] as bool? ?? false,
      assessor: json['assessor'] as String? ?? '',
      reviewer: json['reviewer'] as String? ?? '',
    );

Map<String, dynamic> _$SpecieToJson(Specie instance) {
  final val = <String, dynamic>{
    'taxonid': instance.taxonId,
    'scientific_name': instance.scientificName,
    'subspecies': instance.subspecies,
    'rank': instance.rank,
    'subpopulation': instance.subpopulation,
    'kingdom': instance.kingdom,
    'phylum': instance.phylum,
    'class': instance.classification,
    'order': instance.order,
    'family': instance.family,
    'genus': instance.genus,
    'main_common_name': instance.mainCommonName,
    'authority': instance.authority,
    'published_year': instance.publishedYear,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('assessment_date', instance.assessmentDate?.toIso8601String());
  val['category'] = instance.category;
  val['criteria'] = instance.criteria;
  val['population_trend'] = instance.populationTrend;
  val['marine_system'] = instance.marineSystem;
  val['freshwater_system'] = instance.freshwaterSystem;
  val['terrestrial_system'] = instance.terrestrialSystem;
  val['assessor'] = instance.assessor;
  val['reviewer'] = instance.reviewer;
  return val;
}
