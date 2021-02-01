import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/models/nutritionist.dart';

class CurrentUser extends ChangeNotifier {
  // NutrisModel _currentUser = NutrisModel();

  // NutrisModel get getCurrentUser => _currentUser;

  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<String> onStartUp() async {
  //   String retVal = 'error';
  //   try {
  //     FirebaseUser _firebaseUser = await _auth.currentUser();
  //     _currentUser.uid = _firebaseUser.uid;
  //     _currentUser.email = _firebaseUser.email;
  //     retVal = 'success';
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  // Future<String> signOut() async {
  //   String retVal = 'error';
  //   try {
  //     await _auth.signOut();
  //     _currentUser = NutrisModel();
  //     retVal = 'success';
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  Future<String> signUpUser(String email, String password) async {
    String retVal = 'error';
    // NutrisModel _user = NutrisModel();

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // _user.uid = _authResult.user.uid;
      // _user.email = _authResult.user.email;
      // _user.fullName = fullName;
      // _user.gender = gender;
      // _user.phone = phone;
      //String _returnString = await OurDatabase().createUser(_user);
      // if (_returnString == 'success') {
      retVal = "success";
      // }

    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = 'error';

    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // _currentUser.uid = _authResult.user.uid;
      // _currentUser.email = _authResult.user.email;

      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      retVal = 'success';
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }
}
