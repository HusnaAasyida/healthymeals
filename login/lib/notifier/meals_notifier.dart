import 'dart:collection';

import 'package:login/models/meals.dart';
import 'package:flutter/cupertino.dart';

class MealsNotifier with ChangeNotifier {
  List<Meals> _mealsList = [];
  Meals _currentMeals;

  UnmodifiableListView<Meals> get mealsList => UnmodifiableListView(_mealsList);

  Meals get currentMeals => _currentMeals;

  set mealsList(List<Meals> mealsList) {
    _mealsList = mealsList;
    notifyListeners();
  }

  set currentMeals(Meals meals) {
    _currentMeals = meals;
    notifyListeners();
  }

  addMeals(Meals meals) {
    _mealsList.insert(0, meals);
    notifyListeners();
  }

  deleteMeals(Meals meals) {
    _mealsList.removeWhere((_meals) => _meals.id == meals.id);
    notifyListeners();
  }
}
