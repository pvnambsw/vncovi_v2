import 'package:dio/dio.dart';

class UserDeclarationPost {
  var dio = Dio();

  Future postData(
      String fullname,
      String gender,
      String birthday,
      String cccd,
      String phone,
      String bhyt,
      String address,
      String nationality,
      String acrossPlace,
      String signs,
      String contactWith,
      String account) async {
    var res = await dio.post('http://192.168.225.181:3030/declaration',
        data: FormData.fromMap({
          "fullname": fullname,
          "gender": gender,
          "birthday": birthday,
          "CCCD": cccd,
          "phone": phone,
          "BHYT": bhyt,
          "address": address,
          "nationality": nationality,
          "across_place": acrossPlace,
          "signs": signs,
          "contact_with": contactWith,
          "account": account
        }),
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return res.data;
  }
}
