import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'country_info.dart';

part 'countries_covid.g.dart';

@JsonSerializable()
class CountriesCovid extends Equatable{
  final int? updated;
  final String? country;
  final  CountryInfo? countryInfo;
  final  int? cases;
  final  int? todayCases;
  final  int? deaths;
  final  int? todayDeaths;
  final  int? recovered;
  final  int? todayRecovered;
  final  int? active;
  final  int? critical;
  final  int? casesPerOneMillion;
  final  int? deathsPerOneMillion;
  final  int? tests;
  final  int? testsPerOneMillion;
  final  int? population;
  final  String? continent;
  final  int? oneCasePerPeople;
  final  int? oneDeathPerPeople;
  final  int? oneTestPerPeople;
  final  double? activePerOneMillion;
  final  double? recoveredPerOneMillion;
  final  double? criticalPerOneMillion;

  const CountriesCovid(
      {this.updated,
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.tests,
        this.testsPerOneMillion,
        this.population,
        this.continent,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion});

  factory CountriesCovid.fromJson(Map<String, dynamic> json) =>
      _$CountriesCovidFromJson(json);

  @override
  List<Object?> get props => [updated,country, countryInfo, cases, todayCases, deaths, todayDeaths, recovered,
    todayRecovered ,active, critical,casesPerOneMillion,deathsPerOneMillion,tests,testsPerOneMillion,population,
  continent,oneCasePerPeople,oneDeathPerPeople,oneTestPerPeople,activePerOneMillion,recoveredPerOneMillion,criticalPerOneMillion];
}

