// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dvhcvn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dvhcvn _$DvhcvnFromJson(Map<String, dynamic> json) => Dvhcvn(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Province.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataDate: json['data_date'] as String?,
      generateDate: json['generate_date'] as int?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DvhcvnToJson(Dvhcvn instance) => <String, dynamic>{
      'data': instance.data,
      'data_date': instance.dataDate,
      'generate_date': instance.generateDate,
      'stats': instance.stats,
    };
