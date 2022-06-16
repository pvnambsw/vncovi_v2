import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'country_info.g.dart';
@JsonSerializable()
class CountryInfo extends Equatable{
  @JsonKey(name: '_id')
  final int? id;
  final String? iso2;
  final String? iso3;
  final double? lat;
  final double? long;
  final String? flag;

  const CountryInfo({this.id, this.iso2, this.iso3, this.lat, this.long, this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [id, iso2, iso3 ,lat ,long ,flag];
}