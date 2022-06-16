// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      level2Id: json['level2_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      level3s: (json['level3s'] as List<dynamic>?)
          ?.map((e) => Village.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'level2_id': instance.level2Id,
      'name': instance.name,
      'type': instance.type,
      'level3s': instance.level3s,
    };
