import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/api/meals_api.dart';
import 'package:login/models/details.dart';
import 'package:login/models/meals.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/home.dart';
import 'package:login/screens/home/meals_form.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SizedBox(height: 20),
                  Container(
                    height: 80,
                    width: 80,
                    child: SvgPicture.asset(
                      "assets/images/soup.svg",
                      fit: BoxFit.contain,
                    ),
                  ),

                  //minutes of meals
                  SizedBox(height: 16),
                  Text(
                    'Minutes prepare: ${mealsNotifier.currentMeals.minutes}',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),

                  //Ingredients of meals
                  SizedBox(height: 20),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    // crossAxisCount: 3,
                    // crossAxisSpacing: 4,
                    // mainAxisSpacing: 4,
                    children: mealsNotifier.currentMeals.ingredients
                        .map(
                          (ingredient) => Card(
                            color: Colors.brown[100],
                            child: Center(
                              child: Text(
                                ingredient,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16),

                  //direction of meals
                  Text(
                    'Direction:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    // crossAxisCount: 3,
                    // crossAxisSpacing: 4,
                    // mainAxisSpacing: 4,
                    children: mealsNotifier.currentMeals.directions
                        .map(
                          (directions) => Card(
                            color: Colors.brown[100],
                            child: Center(
                              child: Text(
                                directions,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  // Container(
                  //   child: FlatButton.icon(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(18.0),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => HomeScreen()));
                  //     },
                  //     icon: Icon(
                  //       Icons.home,
                  //       color: Colors.white,
                  //     ),
                  //     label: Text("Home"),
                  //     textColor: Colors.white,
                  //     color: Colors.red[300],
                  //   ),
                  //   width: double.infinity,
                  //   padding: EdgeInsets.only(left: 120, right: 120),
                  // ),
                ],
              ),
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
