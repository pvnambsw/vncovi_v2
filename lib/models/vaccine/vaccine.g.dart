// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      'result': instance.result,
    };
