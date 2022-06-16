
import 'package:json_annotation/json_annotation.dart';
part 'stats.g.dart';
@JsonSerializable()
class Stats {
  @JsonKey(name: 'elapsed_time')
 final double? elapsedTime;
  @JsonKey(name: 'level1_count')
  final int? level1Count;
  @JsonKey(name: 'level2_count')
 final int? level2Count;
  @JsonKey(name: 'level3_count')
  final int? level3Count;

  Stats(
      {this.elapsedTime, this.level1Count, this.level2Count, this.level3Count});

  factory Stats.fromJson(Map<String, dynamic> json) =>
      _$StatsFromJson(json);
}