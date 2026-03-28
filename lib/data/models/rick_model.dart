import 'package:json_annotation/json_annotation.dart';

part 'rick_model.g.dart';

@JsonSerializable()
class RickModel {
  RickModel({required this.results, required this.info});

  final List<RickResult> results;
  final InfoModel info;

  factory RickModel.fromJson(Map<String, dynamic> json) =>
      _$RickModelFromJson(json);
}

@JsonSerializable()
class InfoModel {
  InfoModel({required this.prev, required this.next});

  final String? next;
  final String? prev;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

@JsonSerializable()
class RickResult {
  RickResult(
      {required this.name,
      required this.image,
      required this.id,
      required this.gender,
      required this.status,
      required this.species,
      required this.episode});

  final String image;
  final String name;
  final int id;
  final String gender;
  final String status;
  final String species;
  final List<String> episode;

  factory RickResult.fromJson(Map<String, dynamic> json) =>
      _$RickResultFromJson(json);
}

@JsonSerializable()
class EpisodeModel {
  EpisodeModel({required this.name, required this.airDate});

  final String name;
  @JsonKey(name: 'air_date')
  final String airDate;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
}
