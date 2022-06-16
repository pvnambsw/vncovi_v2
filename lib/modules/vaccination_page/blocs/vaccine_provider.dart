import 'package:flutter/material.dart';

import '../../../repository/vaccine_repo.dart';

class VaccineProvider extends ChangeNotifier {
  List<String>? _items = [];

  List<String>? get item => _items;

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

  String _selectedItem = '';

  String get selected => _selectedItem;

  void setselected(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void setData(List<String>? val) {
    _items = val;
    notifyListeners();
  }


  int _idVaccine = 0;

  int get idVaccine => _idVaccine;

  void setIdVaccine(int id) {
    _idVaccine = id;
    notifyListeners();
  }

  Future<void> getNameVaccine() async {
    setLoading(true);
    List<String> newList = await _service.getNameVaccine(
      onError: (message) {
        setError(true, message);
        setLoading(false);
      },
    );
    setselected(newList.first);
    setData(newList);
    setLoading(false);
  }

  Future<void> getIdVaccine() async {
    setLoading(true);
    int id = await _service.getIdVaccine(selected);
    setIdVaccine(id);
    setLoading(false);
  }

}
