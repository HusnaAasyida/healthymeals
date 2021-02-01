import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/type.dart';

class TypeServices {
  String collection = "types";
  Firestore _firestore = Firestore.instance;

  Future<List<TypeModel>> getTypes() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<TypeModel> types = [];
        for (DocumentSnapshot type in result.documents) {
          types.add(TypeModel.fromSnapshot(type));
        }
        return types;
      });
}
