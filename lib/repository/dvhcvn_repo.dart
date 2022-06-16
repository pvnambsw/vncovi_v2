import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/dvhcvn/dvhcvn.dart';


const assetKey = 'assets/data/dvhcvn.json';

class DvhcvnRepo {
  // List<String> get province =>_province;
  Future<List<String>> loadProvince() async {
    List<String> _province = List.empty(growable: true);
    try {
      final json = await rootBundle.loadString(assetKey);
      Dvhcvn dvhcvn = Dvhcvn.fromJson(jsonDecode(json));
      _province = dvhcvn.data!.map((e) => e.name.toString()).toList();
      print(_province);
      return _province;
    } catch (e) {
      rethrow;
    }
  }

// Future<List<String>> loadDistrictByProvince(String province)async{
//   List<String> districtByProvince = List.empty(growable: true);
//   try {
//     final json = await rootBundle.loadString(assetKey);
//     Dvhcvn dvhcvn = Dvhcvn.fromJson(jsonDecode(json));
//     districtByProvince= dvhcvn.data!.where((element) => element.name ==province).map((e) => e.level2s!.map((e) => e.name).toString()).toList();
//     //forEach((element) =>districtByProvince.add(element.name!)));
//     // districtByProvince = dvhcvn.data!.where((element) => element.name ==province).map((e) => e.level2s!.map((e) => e.level2Id).toString()).toList();
//     //     //where((element) => element.name ==province).map((e) => e.level2s!.map((e) => e.name).toString()).toList();
//   // print(districtByProvince.expand((e) => [e]).toList());
//     print(districtByProvince);
//     return districtByProvince;
//   } catch (e) {
//     rethrow;
//   }
// }
// List dataDvhcvn = List.empty(growable: true);
//   List<String> districtByProvince = List.empty(growable: true);
// Future<List<String>> loadDistrictByProvince(String province)async{
//     final json = await rootBundle.loadString(assetKey);
//     final map = jsonDecode(json);
//     dataDvhcvn.addAll(map['data']);
//     for(int i=0;i<dataDvhcvn.length;i++){
//       if(dataDvhcvn[i]['name']==province){
//         for(int j=0;j<dataDvhcvn[i]['name']['level2s'].length;j++){
//           districtByProvince.add(dataDvhcvn[i]['level2s']['name']);
//         }
//
//       }
//     }
//     print(districtByProvince);
//     return districtByProvince;
//
//
// }

// Future<List<String>> loadDistrict()async{
//   List<String> district = List.empty(growable: true);
//   try {
//     final json = await rootBundle.loadString(assetKey);
//     Dvhcvn dvhcvn = Dvhcvn.fromJson(jsonDecode(json));
//     district = dvhcvn.data!.map((e) => e.level2s!.map((e) => e.name).toString()).toList();
//     print(district.length);
//     return district;
//   } catch (e) {
//     rethrow;
//   }
// }

// Future<List<String>> loadVillage()async{
//   List<String> village = List.empty(growable: true);
//   try {
//     final json = await rootBundle.loadString(assetKey);
//     Dvhcvn dvhcvn = Dvhcvn.fromJson(jsonDecode(json));
//     village = dvhcvn.data!.map((e) => e.level2s!.map((e) => e.level3s!.map((e) => e.name)).toString()).toList();
//     print(village);
//     return village;
//   } catch (e) {
//     rethrow;
//   }
// }
}
