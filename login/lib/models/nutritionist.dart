import 'package:cloud_firestore/cloud_firestore.dart';

class Nutritionist {
  final String username;
  int age;
  final String gender;
  final String phone;
  final String work;
  final String certified;

  // Details.fromMap(Map<String, dynamic> data) {
  //   username = data['username'];
  //   gender = data['gender'];
  //   weight = data['weight'];
  //   height = data['height'];
  // }

  Nutritionist({
    this.username,
    this.age,
    this.gender,
    this.phone,
    this.work,
    this.certified,
  });
}

//class NutrisModel {
//   String uid;
//   String email;
//   String fullName;
//   String phone;
//   String gender;

//   NutrisModel({
//     this.uid,
//     this.email,
//     this.fullName,
//     this.phone,
//     this.gender,
//   });

//   NutrisModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
//     uid = doc.documentID;
//     email = doc.data['email'];
//     fullName = doc.data['fullName'];
//     phone = doc.data['phone'];
//     gender = doc.data['gender'];
//   }
// }
