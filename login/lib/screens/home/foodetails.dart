import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/api/meals_api.dart';
import 'package:login/models/details.dart';
import 'package:login/models/meals.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/meals_form.dart';
import 'package:login/screens/home/recipedetails.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    MealsNotifier mealsNotifier = Provider.of<MealsNotifier>(context);

    _onMealsDeleted(Meals meals) {
      Navigator.pop(context);
      mealsNotifier.deleteMeals(meals);
    }

    return StreamProvider<List<Details>>.value(
      value: DatabaseService().details,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(mealsNotifier.currentMeals.name),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[],
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

                //name of meals
                SizedBox(height: 24),
                Text(
                  mealsNotifier.currentMeals.name,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),

                //category of meals
                SizedBox(height: 16),
                Text(
                  'Category: ${mealsNotifier.currentMeals.category}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //type of meals
                SizedBox(height: 16),
                Text(
                  'Type: ${mealsNotifier.currentMeals.type}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //calories of meals
                SizedBox(height: 16),
                Text(
                  'Calories: ${mealsNotifier.currentMeals.calories}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //serving of meals
                SizedBox(height: 16),
                Text(
                  'Serving: ${mealsNotifier.currentMeals.serving}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //minutes of meals
                SizedBox(height: 16),
                Text(
                  'Minutes prepare: ${mealsNotifier.currentMeals.minutes}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //Ingredients of meals
                SizedBox(height: 20),

                //direction of meals
                // Text('Direction:'),
                // SizedBox(height: 16),
                // Text(
                //   mealsNotifier.currentMeals.directions,
                //   style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'button1',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MealsForm(
                      isUpdating: true,
                    );
                  }),
                );
              },
              child: Icon(Icons.edit),
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: 'button2',
              onPressed: () =>
                  deleteMeals(mealsNotifier.currentMeals, _onMealsDeleted),
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ],
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
//                 return MealsForm(
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
//               deleteMeals(mealsNotifier.currentMeals, _onMealsDeleted),
//           child: Icon(Icons.delete),
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//         ),
//       ],
//     ),
//   );
// }
