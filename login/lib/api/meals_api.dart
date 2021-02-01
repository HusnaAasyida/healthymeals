import 'dart:io';

import 'package:login/models/category.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login/models/meals.dart';
import 'package:login/notifier/user_notifier.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

getMeal(MealsNotifier mealsNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('meals') //nama dari firestore collection
      .getDocuments();

  List<Meals> _mealsList = [];

  snapshot.documents.forEach((document) {
    Meals meals = Meals.fromMap(document.data);
    _mealsList.add(meals);
  });

  mealsNotifier.mealsList = _mealsList;
}

uploadMealsAndImage(Meals meals, bool isUpdating, File localFile,
    Function mealsUploaded) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('meals/images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(localFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadMeals(meals, isUpdating, mealsUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadMeals(meals, isUpdating, mealsUploaded);
  }
}

_uploadMeals(Meals meals, bool isUpdating, Function mealsUploaded,
    {String imageUrl}) async {
  CollectionReference mealsRef = Firestore.instance.collection('meals');

  if (imageUrl != null) {
    meals.image = imageUrl;
  }

  if (isUpdating) {
    //meals.updatedAt = Timestamp.now();

    await mealsRef.document(meals.id).updateData(meals.toMap());

    mealsUploaded(meals);
    print('updated meals with id: ${meals.id}');
  } else {
    //meals.createdAt = Timestamp.now();

    DocumentReference documentRef = await mealsRef.add(meals.toMap());

    meals.id = documentRef.documentID;

    print('uploaded meals successfully: ${meals.toString()}');

    await documentRef.setData(meals.toMap(), merge: true);

    mealsUploaded(meals);
  }
}

deleteMeals(Meals meals, Function mealsDeleted) async {
  if (meals.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(meals.image);

    print(storageReference.path);

    await storageReference.delete();

    print('image deleted');
  }

  await Firestore.instance.collection('meals').document(meals.id).delete();
  mealsDeleted(meals);
}
