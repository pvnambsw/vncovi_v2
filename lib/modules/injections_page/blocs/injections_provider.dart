import 'package:flutter/material.dart';

import '../../../models/vaccine/result.dart';
import '../../../repository/vaccine_repo.dart';

class InjectionsProvider extends ChangeNotifier {
  List<Result>? _vaccine = [];

  List<Result>? get vaccine => _vaccine;

  List<String>? _image = [];

  List<String>? get image => _image;
  bool _loading = false;

  bool get loading => _loading;

  bool _error = false;

  bool get error => _error;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  VaccineRepo _service = VaccineRepo();

  void setError(bool value, String? message) {
    _error = value;
    _errorMessage = message;
    notifyListeners();
  }

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void setDataVaccine(List<Result>? val) {
    _vaccine = val;
    notifyListeners();
  }
  void setImageVaccine(List<String>? val) {
    _image = val;
    notifyListeners();
  }
  String _idVaccine = '';

  String get idVaccine => _idVaccine;

  String _nameVaccine = '';

  String get nameVaccine => _nameVaccine;

  String _typeVaccine = '';

  String get typeVaccine => _typeVaccine;

  String _doses = '';

  String get doses => _doses;

  String _effective = '';

  String get effective => _effective;

  String _company = '';

  String get company => _company;

  String _storage = '';

  String get storage => _storage;

  // String _image = '';
  //
  // String get image => _image;

  // void setDetailDataVaccine(String id, String name, String type, String doses,
  //     String effective, String company, String storage, String image) {
  //   _idVaccine = id;
  //   _nameVaccine = name;
  //   _typeVaccine = type;
  //   _doses = doses;
  //   _effective = effective;
  //   _company = company;
  //   _storage = storage;
  //   _image=image;
  //   notifyListeners();
  // }

  Future<void> getVaccine() async {
    setLoading(true);
    List<Result>? newList = await _service.getVaccine(
      onError: (message) {
        setError(true, message);
        setLoading(false);
      },
    );
    setDataVaccine(newList);
    setLoading(false);
  }
}
