import 'package:dio/dio.dart';

import '../models/countries_covid.dart';
import '../models/country_info.dart';


const url = 'https://disease.sh/v3/covid-19/countries';
final urlCountry = (country) => "$url/${country}";

class CountriesCovidRepo {
  var dio = Dio();

  Future<List<String>> getCountry({Function(String message)? onError}) async {
    try {
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        final data = res.data as List;
        final List<String> countryList =
            data.map((e) => e['country'].toString()).toList();
        return countryList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CountriesCovid> getCovidCountry(String country) async {
    try {
      var res = await dio.get(urlCountry(country));
      if (res.statusCode == 200) {
        final dataCovidCountry = res.data;
        print(dataCovidCountry);
        return CountriesCovid.fromJson(dataCovidCountry);
      } else {
        throw Exception('Không lấy được dữ liệu');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CountryInfo> getFlagCountry(String country) async {
    try {
      var res = await dio.get(urlCountry(country));
      if (res.statusCode == 200) {
        final dataFlagCountry = res.data['countryInfo'];
        print(dataFlagCountry);
        return CountryInfo.fromJson(dataFlagCountry);
      } else {
        throw Exception('Không lấy được dữ liệu');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<List<CountryInfo>?> getFlagCountries({Function(String message)? onError}) async {
  //   try {
  //     var res = await dio.get(url);
  //     if (res.statusCode == 200) {
  //       final List data = res.data['countryInfo'];
  //       print(data);
  //       final List<CountryInfo> countriesFlag =
  //       data.map((json) => CountryInfo.fromJson(json)).toList();
  //       return countriesFlag;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<List<CountriesCovid>?> getCountriesCovid(
      {Function(String message)? onError}) async {
    try {
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        final List data = res.data;
        final List<CountriesCovid> countriesCovid =
            data.map((json) => CountriesCovid.fromJson(json)).toList();
        return countriesCovid;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
