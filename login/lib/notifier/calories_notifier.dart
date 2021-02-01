import 'package:flutter/material.dart';
import 'package:login/api/calories_api.dart';
import '../models/calories.dart';

class CalorieProvider with ChangeNotifier {
  CalorieServices _calorieServices = CalorieServices();
  List<CalorieModel> calories = [];

  CalorieProvider.initialize() {
    loadCalories();
  }

  loadCalories() async {
    calories = await _calorieServices.getCalories();
    notifyListeners();
  }
}
