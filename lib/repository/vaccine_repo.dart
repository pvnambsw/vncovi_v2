import 'package:dio/dio.dart';

import '../models/vaccine/result.dart';


String url = 'http://192.168.225.181:3030/vaccine';

class VaccineRepo {
  var dio = Dio();

  Future<List<Result>> getVaccine({Function(String message)? onError}) async {
    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        final dataVaccine = res.data['result'] as List;
        final List<Result> vaccineCovid =
            dataVaccine.map((json) => Result.fromJson(json)).toList();
        return vaccineCovid;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getIdVaccine(String nameVaccine) async {
    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        final dataVaccine = res.data['result'] as List;
        // final String idVaccine = dataVaccine.where((element) => element['name_vaccine']==nameVaccine).toString();
        final String idVaccine0 = dataVaccine
            .where((element) => element['name_vaccine'] == nameVaccine)
            .map((e) => Result.fromJson(e).idVaccine)
            .toString();
        final removeBrackets = idVaccine0.substring(1, idVaccine0.length - 1);
        final int idVaccine = int.parse(removeBrackets);
        print(idVaccine);
        return idVaccine;
      } else {
        return 0;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getNameVaccine(
      {Function(String message)? onError}) async {
    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        final dataVaccine = res.data['result'] as List;
        final List<String> nameVaccine =
            dataVaccine.map((e) => e['name_vaccine'].toString()).toList();
        print(nameVaccine);
        return nameVaccine;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
