import 'package:hivecrud/api/entity/OriginEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CharResponse.g.dart';

@JsonSerializable()
class CharResponse {
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

  @JsonKey(name: 'origin')
  final OriginEntity originEntity;

  CharResponse({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.originEntity,
  });

  factory CharResponse.fromJson(Map<String, dynamic> json) =>
      _$CharResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharResponseToJson(this);
}
