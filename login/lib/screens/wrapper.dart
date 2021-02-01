import 'package:login/models/nutris.dart';
import 'package:login/models/user.dart';
import 'package:login/models/user.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/authenticateNutris.dart';
import 'package:login/screens/home/userHome.dart';
import 'package:login/screens/home/home.dart';
import 'package:login/screens/home/user_details.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    }
    else {
      return HomeScreen();
    }
  }
}
