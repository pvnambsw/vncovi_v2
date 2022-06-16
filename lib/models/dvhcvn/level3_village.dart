
import 'package:json_annotation/json_annotation.dart';
part 'level3_village.g.dart';
@JsonSerializable()
class Village {
  @JsonKey(name: 'level3_id')
  final String? level3Id;
  final String? name;
  final String? type;

  Village({this.level3Id, this.name, this.type});

  factory Village.fromJson(Map<String, dynamic> json) =>
      _$VillageFromJson(json);
}
