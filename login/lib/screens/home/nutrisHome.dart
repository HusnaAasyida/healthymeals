import 'package:flutter/material.dart';
import 'package:login/helpers/screen_navigation.dart';
import 'package:login/models/details.dart';
import 'package:login/models/nutritionist.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/home/bmiques.dart';
import 'package:login/screens/home/calsques.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/screens/home/filterlist.dart';
import 'package:login/screens/home/momentlist.dart';
import 'package:login/screens/home/nutris_details.dart';
import 'package:login/screens/home/settings_form_nut.dart';
import 'package:login/screens/home/typebutton.dart';
import 'package:login/screens/home/user_details.dart';
import 'package:login/screens/home/food.dart';
import 'package:login/screens/home/settings_form.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/auth2.dart';
import 'package:login/services/database.dart';
import 'package:login/services/database2.dart';
import 'package:login/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:login/screens/home/home.dart';

class HomeNut extends StatelessWidget {
  final AuthService2 _auth = AuthService2();
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
              child: SettingsFormNut(),
            );
          });
    }

    return StreamProvider<List<Nutritionist>>.value(
      value: DatabaseService2().nutritionist,
      child: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text('Healthy Meals'),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.update),
              label: Text('Update'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  changeScreen(context, HomeNut());
                },
                leading: Icon(Icons.home),
                title: CustomText(text: "Home"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, Food());
                },
                leading: Icon(Icons.note_add),
                title: CustomText(text: "Foods"),
              ),
            ],
          ),
        ),
        //backgroundColor: Colors.white,
        body:
            //Center(
            //   child: ElevatedButton(
            //     child: Text('Open route'),
            //     onPressed: () {
            //       // Navigate to second route when tapped.
            //     },
            //     child: UserDetails(),
            //   ),

            //CategoryList(),
            NutrisDetails(),
        //Food(),
        //Story()
        //Try(),

        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/coffee_bg.png'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
      ),
      //),
    );
  }
}
