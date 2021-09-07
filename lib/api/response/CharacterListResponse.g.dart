// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CharacterListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListResponse _$CharacterListResponseFromJson(
    Map<String, dynamic> json) {
  return CharacterListResponse(
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => ResultsEntity.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharacterListResponseToJson(
        CharacterListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
