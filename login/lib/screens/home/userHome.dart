import 'package:flutter/material.dart';
import 'package:login/helpers/screen_navigation.dart';
import 'package:login/models/details.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/home/bmiques.dart';
import 'package:login/screens/home/calsques.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/screens/home/filterlist.dart';
import 'package:login/screens/home/momentlist.dart';
import 'package:login/screens/home/typebutton.dart';
import 'package:login/screens/home/user_details.dart';
import 'package:login/screens/home/food.dart';
import 'package:login/screens/home/settings_form.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:login/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:login/screens/home/home.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final typeProvider = Provider.of<TypeProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final mealProvider = Provider.of<MealProvider>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Details>>.value(
      value: DatabaseService().details,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.update),
              label: Text('Update'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),

        //backgroundColor: Colors.white,
        body: UserDetails(),
      ),
      //),
    );
  }
}
