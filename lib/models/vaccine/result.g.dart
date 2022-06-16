// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      idVaccine: json['id_vaccine'] as int?,
      nameVaccine: json['name_vaccine'] as String?,
      typeVaccine: json['type_vaccine'] as String?,
      doses: json['doses'] as String?,
      effective: json['effective'] as String?,
      company: json['company'] as String?,
      storage: json['storage'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id_vaccine': instance.idVaccine,
      'name_vaccine': instance.nameVaccine,
      'type_vaccine': instance.typeVaccine,
      'doses': instance.doses,
      'effective': instance.effective,
      'company': instance.company,
      'storage': instance.storage,
      'image': instance.image,
    };
