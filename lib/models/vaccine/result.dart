import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';
@JsonSerializable()
class Result {
  @JsonKey(name: 'id_vaccine')
 final int? idVaccine;
  @JsonKey(name: 'name_vaccine')
  final String? nameVaccine;
  @JsonKey(name: 'type_vaccine')
  final String? typeVaccine;
  final String? doses;
  final String? effective;
  final String? company;
  final  String? storage;
  final String? image;

  Result(
      {this.idVaccine,
        this.nameVaccine,
        this.typeVaccine,
        this.doses,
        this.effective,
        this.company,
        this.storage,
        this.image});

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
}