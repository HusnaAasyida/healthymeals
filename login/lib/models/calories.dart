import 'package:cloud_firestore/cloud_firestore.dart';

class CalorieModel {
  static const ID = "id";
  static const CALORIESTOT = "caloriestot";

  int _id;
  double _caloriestot;

  //  getters
  int get id => _id;

  double get caloriestot => _caloriestot;

  CalorieModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _caloriestot = snapshot.data[CALORIESTOT];
  }
}
