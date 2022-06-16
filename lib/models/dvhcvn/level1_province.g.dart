// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level1_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      level1Id: json['level1_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      level2s: (json['level2s'] as List<dynamic>?)
          ?.map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'level1_id': instance.level1Id,
      'name': instance.name,
      'type': instance.type,
      'level2s': instance.level2s,
    };
