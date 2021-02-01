import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/models/menu.dart';

class MealServices {
  String collection = "meals";
  String collection1 = "details";
  Firestore _firestore = Firestore.instance;

  Future<List<MealModel>> getMeals() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }
        return meals;
      });

  Future<List<MealModel>> getMealsOfCategory({String category}) => _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .where("type", isEqualTo: 'Breakfast')
          .getDocuments()
          .then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }

        return meals;
      });

  Future<List<MealModel>> getMealsOfCategory2({String category}) => _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .where("type", isEqualTo: 'Lunch')
          .getDocuments()
          .then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }

        return meals;
      });
  Future<List<MealModel>> getMealsOfCategory3({String category}) => _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .where("type", isEqualTo: 'Dinner')
          .getDocuments()
          .then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }

        return meals;
      });

  Future<List<MealModel>> getMealsOfType({String type}) => _firestore
          .collection(collection)
          .where("type", isEqualTo: type)
          .getDocuments()
          .then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }

        return meals;
      });

  Future<List<MealModel>> getMealsOfCalories({double calories}) => _firestore
          .collection(collection)
          .where("calories", isEqualTo: calories)
          .getDocuments()
          .then((result) {
        List<MealModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealModel.fromSnapshot(meal));
        }

        return meals;
      });

  // Future<List<MealModel>> getMealsOfUserCalories({int carbs}) => _firestore
  //         .collection(collection1)
  //         .where("carbs", isEqualTo: carbs)
  //         .getDocuments()
  //         .then((result) {
  //       List<MealModel> meals = [];
  //       for (DocumentSnapshot meal in result.documents) {
  //         meals.add(MealModel.fromSnapshot(meal));
  //       }

  //       return meals;
  //     });

  // Future<List<MealModel>> getMealsOfUserCalories(
  //         {double carbs, double protein, double fats}) =>
  //     _firestore
  //         .collection(collection)
  //         .where("carbs", isEqualTo: carbs)
  //         .where("protein", isEqualTo: protein)
  //         .where("fats", isEqualTo: fats)
  //         .getDocuments()
  //         .then((result) {
  //       List<MealModel> meals = [];
  //       for (DocumentSnapshot meal in result.documents) {
  //         meals.add(MealModel.fromSnapshot(meal));
  //       }

  //       return meals;
  //     });
}
