import 'package:login/helpers/appRoutes.dart';
import 'package:login/helpers/theme.dart';
import 'package:login/models/nutris.dart';
import 'package:login/notifier/calories_notifier.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/currentUser.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/moments_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/authenticate/root.dart';
import 'package:login/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/auth2.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'notifier/meals_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MealsNotifier()),
      ChangeNotifierProvider(create: (context) => MomentsNotifier()),
      //ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider.value(value: TypeProvider.initialize()),
      ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
      ChangeNotifierProvider.value(value: MealProvider.initialize()),
      ChangeNotifierProvider.value(value: CalorieProvider.initialize()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );

    // else if (nutris == null) {
    //   return StreamProvider<Nutris>.value(
    //     value: AuthService2().nutris,
    //     child: MaterialApp(
    //       home: Wrapper(),
    //     ),
    //   );
    // }
  }
}

// return ChangeNotifierProvider(
//   create: (context) => CurrentUser(),
//   child: MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: OurTheme().buildTheme(),
//     // routes: AppRoutes.define(),
//     home: Login(),
//   ),
// );
