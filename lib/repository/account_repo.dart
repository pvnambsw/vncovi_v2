import 'package:dio/dio.dart';

class AccountRepo {
  var dio = Dio();

  Future postAccountData(String uid, String phone,
      {String? fullname,
      String? birthday,
      String? avatar,
      String? gender,
      String? status}) async {
    var res = await dio.post('http://192.168.225.181:3030/account',
        data: FormData.fromMap({
          "uid": uid,
          "phone": phone,
          "fullname": fullname,
          "birthday": birthday,
          "avatar": avatar,
          "gender": gender,
          "status": status
        }),
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return res.data;
  }
}
