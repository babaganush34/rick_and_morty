// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RickModel _$RickModelFromJson(Map<String, dynamic> json) => RickModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => RickResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RickModelToJson(RickModel instance) => <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'next': instance.next,
      'prev': instance.prev,
    };

RickResult _$RickResultFromJson(Map<String, dynamic> json) => RickResult(
      name: json['name'] as String,
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
      gender: json['gender'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RickResultToJson(RickResult instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'id': instance.id,
      'gender': instance.gender,
      'status': instance.status,
      'species': instance.species,
      'episode': instance.episode,
    };

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      name: json['name'] as String,
      airDate: json['air_date'] as String,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'air_date': instance.airDate,
    };
