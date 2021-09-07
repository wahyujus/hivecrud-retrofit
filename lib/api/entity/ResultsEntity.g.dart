// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultsEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsEntity _$ResultsEntityFromJson(Map<String, dynamic> json) {
  return ResultsEntity(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    species: json['species'] as String,
    type: json['type'] as String,
    gender: json['gender'] as String,
    image: json['image'] as String,
    created: json['created'] as String,
    url: json['url'] as String,
    origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    episode:
        (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ResultsEntityToJson(ResultsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'created': instance.created,
      'url': instance.url,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };

Origin _$OriginFromJson(Map<String, dynamic> json) {
  return Origin(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
