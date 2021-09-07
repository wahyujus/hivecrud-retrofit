import 'package:json_annotation/json_annotation.dart';

part 'ResultsEntity.g.dart';

@JsonSerializable()
class ResultsEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'species')
  final String species;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'created')
  final String created;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'origin')
  final Origin origin;

  @JsonKey(name: 'location')
  final Location location;

  @JsonKey(name: 'episode')
  final List<String> episode;

  ResultsEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.created,
    required this.url,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory ResultsEntity.fromJson(Map<String, dynamic> json) =>
      _$ResultsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsEntityToJson(this);
}

@JsonSerializable()
class Origin {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

// @JsonSerializable()
// class Episode {
//   @JsonKey(name: 'episode')
//   final List<String> episode;

//   Episode({
//     required this.episode,
//   });

//   factory Episode.fromJson(Map<String, dynamic> json) =>
//       _$EpisodeFromJson(json);

//   Map<String, dynamic> toJson() => _$EpisodeToJson(this);
// }
