import 'package:cloud_firestore/cloud_firestore.dart';

class TypeModel {
  static const ID = "id";
  static const NAME = "name";

  int _id;
  String _name;

  //  getters
  int get id => _id;

  String get name => _name;

  TypeModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
  }
}
