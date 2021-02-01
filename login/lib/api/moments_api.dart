import 'dart:io';

import 'package:login/models/category.dart';
import 'package:login/models/moments.dart';
import 'package:login/notifier/moments_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login/models/moments.dart';
import 'package:login/notifier/user_notifier.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

getMoments(MomentsNotifier momentsNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('moments') //nama dari firestore collection
      .getDocuments();

  List<Moments> _momentsList = [];

  snapshot.documents.forEach((document) {
    Moments moments = Moments.fromMap(document.data);
    _momentsList.add(moments);
  });

  momentsNotifier.momentsList = _momentsList;
}

uploadMomentsAndImage(Moments moments, bool isUpdating, File localFile,
    Function momentsUploaded) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('moments/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(localFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadMoments(moments, isUpdating, momentsUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadMoments(moments, isUpdating, momentsUploaded);
  }
}

_uploadMoments(Moments moments, bool isUpdating, Function momentsUploaded,
    {String imageUrl}) async {
  CollectionReference momentsRef = Firestore.instance.collection('moments');

  if (imageUrl != null) {
    moments.image = imageUrl;
  }

  if (isUpdating) {
    await momentsRef.document(moments.id).updateData(moments.toMap());

    momentsUploaded(moments);

    print('updated moments with id: ${moments.id}');
  } else {
    DocumentReference documentRef = await momentsRef.add(moments.toMap());

    moments.id = documentRef.documentID;

    print('uploaded moments successfully: ${moments.toString()}');

    await documentRef.setData(moments.toMap(), merge: true);
    momentsUploaded(moments);
  }
}

deleteMoments(Moments moments, Function momentsDeleted) async {
  if (moments.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(moments.image);

    print(storageReference.path);

    await storageReference.delete(); //image delete

    print('image deleted');
  }

  await Firestore.instance.collection('moments').document(moments.id).delete();

  ///doc delete
  momentsDeleted(moments);
}
