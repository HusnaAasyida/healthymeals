import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/style.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/home/categorybreakfast.dart';
import 'package:login/screens/home/categorydinner.dart';
import 'package:login/screens/home/categorylunch.dart';
import 'package:login/services/auth.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/custom_text.dart';

import 'package:provider/provider.dart';

class TypeButton extends StatefulWidget {
  @override
  _TypeButtonState createState() => _TypeButtonState();
}

class _TypeButtonState extends State<TypeButton> {
  final AuthService _auth = AuthService();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    //final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final typeProvider = Provider.of<TypeProvider>(context);
    final mealProvider = Provider.of<MealProvider>(context);

    // Future<void> _refreshList() async {
    //   getMeal(mealsNotifier);
    // }

    print("building Meals");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: Colors.red[300],
        title: CustomText(
          text: "FoodApp",
          color: white,
        ),
      ),
      body: loading
          ? Loading()
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                          color: Colors.red[300],
                          child: Text(
                            'Breakfast',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryBList()),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                          color: Colors.red[300],
                          child: Text(
                            'Lunch',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryLList()),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                          color: Colors.red[300],
                          child: Text(
                            'Dinner',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryDList()),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
