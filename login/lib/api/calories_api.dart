import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/calories.dart';

class CalorieServices {
  String collection = "calories";
  Firestore _firestore = Firestore.instance;

  Future<List<CalorieModel>> getCalories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CalorieModel> calories = [];
        for (DocumentSnapshot calorie in result.documents) {
          calories.add(CalorieModel.fromSnapshot(calorie));
        }
        return calories;
      });
}
