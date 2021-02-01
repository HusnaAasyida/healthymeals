import 'package:login/models/nutris.dart';
import 'package:login/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/services/database2.dart';

import 'database.dart';

class AuthService2 {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  Nutris _userFromFirebaseUser(FirebaseUser nutris) {
    return nutris != null ? Nutris(uid: nutris.uid) : null;
  }

  // auth change user stream
  Stream<Nutris> get nutris {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // //get UID
  // Future<String> getCurrentUID() async {
  //   return (await _auth.currentUser()).uid;
  // }

  // //get current user
  // Future getCurrentUser() async {
  //   return await _auth.currentUser();
  // }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser nutris = result.user;
      return _userFromFirebaseUser(nutris);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser nutris = result.user;
      return nutris;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser nutris = result.user;
      // create a new document for the user with the uid
      await DatabaseService2(uid: nutris.uid)
          .updateNutData('', 0, '', '', '', '');
      return _userFromFirebaseUser(nutris);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
