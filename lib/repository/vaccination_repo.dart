import 'package:dio/dio.dart';

class VaccinationRepo {
  var dio = Dio();

  Future postData(
      String fullname,
      String gender,
      String birthday,
      String phone,
      String cccd,
      String bhyt,
      String address,
      String occupation,
      String workplace,
      String ethnic,
      String injections,
      String injection_session,
      String priority_group,
      String user_vaccination,
      int id_vaccine) async {
    var res = await dio.post('http://192.168.225.181:3030/vaccination',
        data: FormData.fromMap({
          "fullname": fullname,
          "gender": gender,
          "birthday": birthday,
          "phone": phone,
          "CCCD": cccd,
          "BHYT": bhyt,
          "address": address,
          "occupation": occupation,
          "workplace": workplace,
          "ethnic": ethnic,
          "injections_page": injections,
          "injection_session": injection_session,
          "priority_group": priority_group,
          "user_vaccination": user_vaccination,
          "id_vaccine": id_vaccine,
        }),
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return res.data;
  }
}
