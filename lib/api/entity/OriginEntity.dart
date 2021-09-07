import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'OriginEntity.g.dart';

@JsonSerializable()
class OriginEntity {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  OriginEntity({
    required this.name,
    required this.url,
  });

  factory OriginEntity.fromJson(Map<String, dynamic> json) =>
      _$OriginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OriginEntityToJson(this);
}
