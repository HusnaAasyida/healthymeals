import 'package:flutter/material.dart';
import 'package:login/api/type_api.dart';
import '../models/type.dart';

class TypeProvider with ChangeNotifier {
  TypeServices _typeServices = TypeServices();
  List<TypeModel> types = [];

  TypeProvider.initialize() {
    loadTypes();
  }

  loadTypes() async {
    types = await _typeServices.getTypes();
    notifyListeners();
  }
}
