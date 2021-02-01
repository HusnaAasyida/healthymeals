import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/api/menu_api.dart';
import 'package:login/models/details.dart';
import 'package:login/models/menu.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/recipedetails.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:provider/provider.dart';

class MenuDetail extends StatelessWidget {
  final MealModel menuModel;

  const MenuDetail({Key key, this.menuModel}) : super(key: key);

  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    MealProvider menuNotifier = Provider.of<MealProvider>(context);

    return StreamProvider<List<Details>>.value(
      value: DatabaseService().details,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(menuNotifier.currentMeals.name),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          // actions: <Widget>[
          //   FlatButton.icon(
          //     icon: Icon(Icons.person),
          //     label: Text('Logout'),
          //     onPressed: () async {
          //       await _auth.signOut();
          //     },
          //   ),
          // ],
        ),
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(
                    "assets/images/soup.svg",
                    fit: BoxFit.contain,
                  ),
                ),

                //name of menu
                SizedBox(height: 24),
                Text(
                  menuNotifier.currentMeals.name,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),

                //category of menu
                SizedBox(height: 16),
                Text(
                  'Category: ${menuNotifier.currentMeals.category}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //type of menu
                SizedBox(height: 16),
                Text(
                  'Type: ${menuNotifier.currentMeals.type}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //calories of menu
                SizedBox(height: 16),
                Text(
                  'Calories: ${menuNotifier.currentMeals.calories}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //serving of menu
                SizedBox(height: 16),
                Text(
                  'Serving: ${menuNotifier.currentMeals.serving}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //minutes of menu
                SizedBox(height: 16),
                Text(
                  'Minutes prepare: ${menuNotifier.currentMeals.minutes}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //Ingredients of menu
                SizedBox(height: 80),

                //direction of menu
                // Text('Direction:'),
                // SizedBox(height: 16),
                // Text(
                //   menuNotifier.currentMenu.directions,
                //   style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                // ),
                Container(
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeDetail()));
                    },
                    icon: Icon(
                      Icons.receipt,
                      color: Colors.white,
                    ),
                    label: Text("Recipe"),
                    textColor: Colors.white,
                    color: Colors.red[300],
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 120, right: 120),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// width: MediaQuery.of(context).size.width,
// height: 250,
// fit: BoxFit.fitWidth,

//     floatingActionButton: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         FloatingActionButton(
//           heroTag: 'button1',
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (BuildContext context) {
//                 return MenuForm(
//                   isUpdating: true,
//                 );
//               }),
//             );
//           },
//           child: Icon(Icons.edit),
//           foregroundColor: Colors.white,
//         ),
//         SizedBox(height: 20),
//         FloatingActionButton(
//           heroTag: 'button2',
//           onPressed: () =>
//               deleteMenu(menuNotifier.currentMenu, _onMenuDeleted),
//           child: Icon(Icons.delete),
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//         ),
//       ],
//     ),
//   );
// }
