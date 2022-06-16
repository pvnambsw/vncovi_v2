

import 'package:json_annotation/json_annotation.dart';

import 'level2_district.dart';
part 'level1_province.g.dart';
@JsonSerializable()
class Province {
  @JsonKey(name: 'level1_id')
  final String? level1Id;
  final  String? name;
  final  String? type;
  final  List<District>? level2s;

  Province({this.level1Id, this.name, this.type, this.level2s});

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
}
