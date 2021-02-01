import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/models/details.dart';
import 'package:login/models/nutris.dart';
import 'package:login/models/nutritionist.dart';
import 'package:login/models/user.dart';

class DatabaseService2 {
  final String uid;
  DatabaseService2({this.uid});

  // collection reference
  // final CollectionReference healthyMeals =
  //     Firestore.instance.collection('details');

  final CollectionReference healthyMeals1 =
      Firestore.instance.collection('nutritionist');

  // Future<void> updateUserData(
  //     String username,
  //     int age,
  //     String gender,
  //     double weight,
  //     double height,
  //     double bmi,
  //     String comments,
  //     double calories,
  //     int carbsUser,
  //     int proteinUser,
  //     int fatUser,
  //     double carbsPerDay,
  //     double proteinPerDay,
  //     double fatPerDay) async {
  //   return await healthyMeals.document(uid).setData({
  //     'username': username,
  //     'age': age,
  //     'gender': gender,
  //     'weight': weight,
  //     'height': height,
  //     'bmi': bmi,
  //     'comments': comments,
  //     'calories': calories,
  //     'carbsUser': carbsUser,
  //     'proteinUser': proteinUser,
  //     'fatUser': fatUser,
  //     'carbsPerDay': carbsPerDay,
  //     'proteinPerDay': proteinPerDay,
  //     'fatPerDay': fatPerDay,
  //   });
  // }

  // // brew list from snapshot
  // List<Details> _healthyMealsFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     //print(doc.data);
  //     return Details(
  //       username: doc.data['username'] ?? '',
  //       age: doc.data['age'] ?? 0,
  //       gender: doc.data['gender'] ?? '',
  //       weight: doc.data['weight'] ?? 0.0,
  //       height: doc.data['height'] ?? 0.0,
  //       bmi: doc.data['bmi'] ?? 0.0,
  //       comments: doc.data['comments'] ?? '',
  //       calories: doc.data['calories'] ?? 0.0,
  //       carbsUser: doc.data['carbsUser'] ?? 0,
  //       proteinUser: doc.data['proteinUser'] ?? 0,
  //       fatUser: doc.data['fatUser'] ?? 0,
  //       carbsPerDay: doc.data['carbsPerDay'] ?? 0.0,
  //       proteinPerDay: doc.data['proteinPerDay'] ?? 0.0,
  //       fatPerDay: doc.data['fatPerDay'] ?? 0.0,
  //     );
  //   }).toList();
  // }

  // // user data from snapshots
  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     username: snapshot.data['username'],
  //     age: snapshot.data['age'],
  //     gender: snapshot.data['gender'],
  //     weight: snapshot.data['weight'],
  //     height: snapshot.data['height'],
  //     bmi: snapshot.data['bmi'],
  //     comments: snapshot.data['comments'],
  //     calories: snapshot.data['calories'],
  //     carbsUser: snapshot.data['carbsUser'],
  //     proteinUser: snapshot.data['proteinUser'],
  //     fatUser: snapshot.data['fatUser'],
  //     carbsPerDay: snapshot.data['carbsPerDay'],
  //     proteinPerDay: snapshot.data['proteinPerDay'],
  //     fatPerDay: snapshot.data['fatPerDay'],
  //   );
  // }

  // Stream<List<Details>> get details {
  //   return healthyMeals.snapshots().map(_healthyMealsFromSnapshot);
  // }

  // // get user doc stream
  // Stream<UserData> get userData {
  //   return healthyMeals.document(uid).snapshots().map(_userDataFromSnapshot);
  // }

  Future<void> updateNutData(
    String username,
    int age,
    String gender,
    String phone,
    String work,
    String certified,
  ) async {
    return await healthyMeals1.document(uid).setData({
      'username': username,
      'age': age,
      'gender': gender,
      'phone': phone,
      'work': work,
      'certified': certified,
    });
  }

  // brew list from snapshot
  List<Nutritionist> _healthyMeals1FromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Nutritionist(
        username: doc.data['username'] ?? '',
        age: doc.data['age'] ?? 0,
        gender: doc.data['gender'] ?? '',
        phone: doc.data['phone'] ?? '',
        work: doc.data['work'] ?? '',
        certified: doc.data['certified'] ?? '',
      );
    }).toList();
  }

  // user data from snapshots
  NutrisData _nutrisDataFromSnapshot(DocumentSnapshot snapshot) {
    return NutrisData(
      uid: uid,
      username: snapshot.data['username'],
      age: snapshot.data['age'],
      gender: snapshot.data['gender'],
      phone: snapshot.data['phone'],
      work: snapshot.data['work'],
      certified: snapshot.data['certified'],
    );
  }

  Stream<List<Nutritionist>> get nutritionist {
    return healthyMeals1.snapshots().map(_healthyMeals1FromSnapshot);
  }

  // get user doc stream
  Stream<NutrisData> get nutrisData {
    return healthyMeals1.document(uid).snapshots().map(_nutrisDataFromSnapshot);
  }
}
