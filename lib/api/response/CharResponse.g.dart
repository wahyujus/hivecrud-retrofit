// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CharResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharResponse _$CharResponseFromJson(Map<String, dynamic> json) {
  return CharResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    species: json['species'] as String,
    type: json['type'] as String,
    gender: json['gender'] as String,
    image: json['image'] as String,
    originEntity: OriginEntity.fromJson(json['origin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharResponseToJson(CharResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'origin': instance.originEntity,
    };
