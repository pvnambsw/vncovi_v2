// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      elapsedTime: (json['elapsed_time'] as num?)?.toDouble(),
      level1Count: json['level1_count'] as int?,
      level2Count: json['level2_count'] as int?,
      level3Count: json['level3_count'] as int?,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'elapsed_time': instance.elapsedTime,
      'level1_count': instance.level1Count,
      'level2_count': instance.level2Count,
      'level3_count': instance.level3Count,
    };
