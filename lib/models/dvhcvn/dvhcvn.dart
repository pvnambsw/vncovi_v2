import 'package:json_annotation/json_annotation.dart';
import 'package:vncovid/models/dvhcvn/stats.dart';

import 'level1_province.dart';
part 'dvhcvn.g.dart';
@JsonSerializable()
class Dvhcvn {
  List<Province>? data;
  @JsonKey(name: 'data_date')
  String? dataDate;
  @JsonKey(name: 'generate_date')
  int? generateDate;
  Stats? stats;

  Dvhcvn({this.data, this.dataDate, this.generateDate, this.stats});

  factory Dvhcvn.fromJson(Map<String, dynamic> json) =>
      _$DvhcvnFromJson(json);
}





