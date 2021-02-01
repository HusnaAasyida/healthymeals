import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/registerN.dart';
import 'package:login/screens/authenticate/signInNut.dart';

class Authenticate1 extends StatefulWidget {
  @override
  _Authenticate1State createState() => _Authenticate1State();
}

class _Authenticate1State extends State<Authenticate1> {
  bool showSignIn1 = true;
  void toggleView1() {
    //print(showSignIn.toString());
    setState(() => showSignIn1 = !showSignIn1);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn1) {
      return SignInNut(toggleView1: toggleView1);
    } else {
      return RegisterN(toggleView1: toggleView1);
    }
  }
}
