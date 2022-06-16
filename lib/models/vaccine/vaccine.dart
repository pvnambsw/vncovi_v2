import 'package:json_annotation/json_annotation.dart';
import 'package:vncovid/models/vaccine/result.dart';

part 'vaccine.g.dart';
@JsonSerializable()
class Vaccine {
  final List<Result>? result;

  Vaccine({this.result});

  factory Vaccine.fromJson(Map<String, dynamic> json) =>
      _$VaccineFromJson(json);
}


//flutter pub run build_runner build
