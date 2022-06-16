
import 'package:json_annotation/json_annotation.dart';

import 'level3_village.dart';

part 'level2_district.g.dart';
@JsonSerializable()
class District {
  @JsonKey(name: 'level2_id')
  final String? level2Id;
  final String? name;
  final String? type;
  final List<Village>? level3s;

  District({this.level2Id, this.name, this.type, this.level3s});

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}