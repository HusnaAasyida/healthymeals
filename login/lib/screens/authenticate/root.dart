// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:login/notifier/currentUser.dart';
// import 'package:login/screens/authenticate/login.dart';
// import 'package:login/screens/home/home.dart';
// import 'package:provider/provider.dart';

// enum AuthStatus { unknown, notLoggedIn, loggedIn }

// class OurRoot extends StatefulWidget {
//   @override
//   _OurRootState createState() => _OurRootState();
// }

// class _OurRootState extends State<OurRoot> {
//   AuthStatus _authStatus = AuthStatus.notLoggedIn;

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();

//     //get the state, check current User, set AuthStatus based on state
//     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//     String _returnString = await _currentUser.onStartUp();
//     if (_returnString == 'success') {
//       setState() {
//         _authStatus = AuthStatus.loggedIn;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget retVal;

//     switch (_authStatus) {
//       case AuthStatus.notLoggedIn:
//         retVal = Login();
//         break;
//       case AuthStatus.loggedIn:
//         retVal = HomeScreen();

//         break;
//       default:
//     }
//     return retVal;
//   }
// }
