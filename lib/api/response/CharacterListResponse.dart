import 'package:json_annotation/json_annotation.dart';

import 'package:hivecrud/api/entity/ResultsEntity.dart';

part 'CharacterListResponse.g.dart';

@JsonSerializable()
class CharacterListResponse {
  @JsonKey(name: 'results')
  final List<ResultsEntity>? results;

  CharacterListResponse({
    this.results,
  });

  factory CharacterListResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListResponseToJson(this);
}
