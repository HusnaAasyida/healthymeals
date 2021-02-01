import 'package:cloud_firestore/cloud_firestore.dart';

class MealModel {
  static const ID = "id";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const CALORIES = "calories";
  static const DIRECTIONS = "directions";
  static const SERVING = "serving";
  static const TYPE = "type";
  static const MINUTES = "minutes";
  static const INGREDIENTS = "ingredients";
  static const CARBS = "carbs";
  static const PROTEIN = "protein";
  static const FAT = "fat";
  static const CATID = "catId";

  String _id;
  String _name;
  String _category;
  double _calories;
  List _directions = [];
  int _serving;
  String _type;
  String _minutes;
  List _ingredients = [];
  int _carbs;
  int _protein;
  int _fat;
  int _catId;

  String get id => _id;

  String get name => _name;

  String get category => _category;

  double get calories => _calories;

  List get directions => _directions;

  int get serving => _serving;

  String get type => _type;

  String get minutes => _minutes;

  List get ingredients => _ingredients;

  int get carbs => _carbs;

  int get protein => _protein;

  int get fat => _fat;

  int get catId => _catId;

  MealModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _category = snapshot.data[CATEGORY];
    _calories = snapshot.data[CALORIES];
    _directions = snapshot.data[DIRECTIONS];
    _serving = snapshot.data[SERVING];
    _type = snapshot.data[TYPE];
    _minutes = snapshot.data[MINUTES];
    _ingredients = snapshot.data[INGREDIENTS];
    _carbs = snapshot.data[CARBS];
    _protein = snapshot.data[PROTEIN];
    _fat = snapshot.data[FAT];
    _catId = snapshot.data[CATID];
  }
}
