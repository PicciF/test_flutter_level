// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@JsonSerializable(includeIfNull: false)
class Specie {
  @JsonKey(defaultValue: 0, name: "taxonid")
  int taxonId;
  @JsonKey(defaultValue: "", name: "scientific_name")
  String scientificName;
  @JsonKey(defaultValue: "")
  String subspecies;
  @JsonKey(defaultValue: "")
  String rank;
  @JsonKey(defaultValue: "")
  String subpopulation;

  @JsonKey(defaultValue: "")
  String kindom;
  @JsonKey(defaultValue: "")
  String phylum;
  @JsonKey(defaultValue: "")
  String classs;
  @JsonKey(defaultValue: "")
  String order;
  @JsonKey(defaultValue: "")
  String family;
  @JsonKey(defaultValue: "")
  String genus;
  @JsonKey(defaultValue: "", name: "main_common_name")
  String mainCommonName;
  @JsonKey(defaultValue: "")
  String authority;
  @JsonKey(defaultValue: 0, name: "published_year")
  int publishedYear;
  @JsonKey(name: "assessment_date")
  DateTime? assessmentDate;
  @JsonKey(defaultValue: "")
  String category;
  @JsonKey(defaultValue: "")
  String criteria;
  @JsonKey(defaultValue: "", name: "population_trend")
  String populationTrend;
  @JsonKey(defaultValue: false, name: "marine_system")
  bool marineSystem;
  @JsonKey(defaultValue: false, name: "freshwater_system")
  bool freshwaterSystem;
  @JsonKey(defaultValue: false, name: "terrestrial_system")
  bool terrestrialSystem;
  @JsonKey(defaultValue: "")
  String assessor;
  @JsonKey(defaultValue: "")
  String reviewer;

  Specie(
      {required this.taxonId,
      required this.scientificName,
      required this.subspecies,
      required this.rank,
      required this.subpopulation,
      required this.kindom,
      required this.phylum,
      required this.classs,
      required this.order,
      required this.family,
      required this.genus,
      required this.mainCommonName,
      required this.authority,
      required this.publishedYear,
      required this.assessmentDate,
      required this.category,
      required this.criteria,
      required this.populationTrend,
      required this.marineSystem,
      required this.freshwaterSystem,
      required this.terrestrialSystem,
      required this.assessor,
      required this.reviewer});

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieToJson(this);
}
