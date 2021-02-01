import 'package:flutter/material.dart';
import 'package:login/api/menu_api.dart';
import 'package:login/models/menu.dart';

class MealProvider with ChangeNotifier {
  MealServices _mealServices = MealServices();
  List<MealModel> meals = [];
  List<MealModel> mealsByCategory = [];
  List<MealModel> mealsByType = [];
  List<MealModel> mealsByCalories = [];
  List<MealModel> mealsByUserCalories = [];
  MealModel _currentMeals;

  MealProvider.initialize() {
    loadMeals();
  }

  loadMeals() async {
    meals = await _mealServices.getMeals();
    notifyListeners();
  }

  MealModel get currentMeals => _currentMeals;

  set currentMeals(MealModel meals) {
    _currentMeals = meals;
    notifyListeners();
  }

  Future loadMealsByCategory({String categoryName}) async {
    mealsByCategory =
        await _mealServices.getMealsOfCategory(category: categoryName);
    notifyListeners();
    print('masuk1');
  }

  Future loadMealsByCategory2({String categoryName}) async {
    mealsByCategory =
        await _mealServices.getMealsOfCategory2(category: categoryName);
    notifyListeners();
    print('masuk1');
  }

  Future loadMealsByCategory3({String categoryName}) async {
    mealsByCategory =
        await _mealServices.getMealsOfCategory3(category: categoryName);
    notifyListeners();
    print('masuk1');
  }

  Future loadMealsByType({String typeName}) async {
    mealsByType = await _mealServices.getMealsOfType(type: typeName);
    notifyListeners();
    print('masuk');
  }

  Future loadMealsByCalories({double caloriesTot}) async {
    mealsByCalories =
        await _mealServices.getMealsOfCalories(calories: caloriesTot);
    notifyListeners();
    print('masuk');
  }

  // Future loadMealsByUserCalories(
  //     {double carbo, double prot, double fat}) async {
  //   mealsByUserCalories = await _mealServices.getMealsOfUserCalories(
  //       carbs: carbo, protein: prot, fats: fat);
  //   notifyListeners();
  //   print('masuk');
  // }
}
