import 'package:login/api/meals_api.dart';
import 'package:login/models/calc.dart';
import 'package:login/models/meals.dart';
import 'package:login/models/user.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:login/screens/home/mealsdetails.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:provider/provider.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final AuthService _auth = AuthService();
  int calspercarbs;
  int calsperprotein;
  int calsperfat;
  double rangecarbs1;
  double rangeprotein1;
  double rangefat1;
  CaloriePerMeal _calPerMealModel;
  Meals mealModel;

  @override
  void initState() {
    MealsNotifier mealsNotifier =
        Provider.of<MealsNotifier>(context, listen: false);
    getMeal(mealsNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    MealsNotifier mealsNotifier = Provider.of<MealsNotifier>(context);
    User user = Provider.of<User>(context);

    Future<void> _refreshList() async {
      getMeal(mealsNotifier);
    }

    print("building Meals");
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.brown[50],
              appBar: AppBar(
                title: Text("List Food"),
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
              body: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red[50],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text('Carbs:'),
                            Text(userData.carbsUser.toString()),
                          ]),
                          Column(
                            children: [
                              Text('Protein:'),
                              Text(userData.proteinUser.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Fat:'),
                              Text(userData.fatUser.toString()),
                            ],
                          ),
                        ]),
                  ),
                  // Container(
                  //   child: FlatButton.icon(
                  //     onPressed: () {
                  //       setState(() {
                  //         calspercarbs = (userData.calories * 0.50) / 4;
                  //         _calPerMealModel =
                  //             CaloriePerMeal(carbs: calspercarbs);
                  //         calsperprotein = (userData.calories * 0.25) / 4;
                  //         _calPerMealModel =
                  //             CaloriePerMeal(protein: calsperprotein);
                  //         calsperfat = (userData.calories * 0.25) / 4;
                  //         _calPerMealModel = CaloriePerMeal(fat: calsperfat);

                  //         if (calspercarbs >= calspercarbs + 10 &&
                  //             calspercarbs < calspercarbs + 11 - 1) {
                  //           calspercarbs = rangecarbs1;
                  //         }

                  //         if (calsperprotein >= calsperprotein + 10 &&
                  //             calsperprotein < calsperprotein + 11 - 1) {
                  //           calsperprotein = rangeprotein1;
                  //         }

                  //         if (calsperfat >= calsperfat + 10 &&
                  //             calsperfat < calsperfat + 11 - 1) {
                  //           calsperfat = rangefat1;
                  //         }
                  //       });
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_right,
                  //       color: Colors.white,
                  //     ),
                  //     label: Text(" Click To See Your Details"),
                  //     textColor: Colors.white,
                  //     color: Colors.red[300],
                  //   ),
                  //   width: double.infinity,
                  //   padding: EdgeInsets.only(left: 16, right: 16),
                  // ),
                  Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: mealsNotifier.mealsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if ((userData.carbsUser ==
                                    mealsNotifier.mealsList[index].carbs ||
                                userData.carbsUser >
                                    mealsNotifier.mealsList[index].carbs) ||
                            (userData.proteinUser ==
                                    mealsNotifier.mealsList[index].protein ||
                                userData.proteinUser >
                                    mealsNotifier.mealsList[index].protein) ||
                            (userData.fatUser ==
                                    mealsNotifier.mealsList[index].fat ||
                                userData.fatUser >
                                    mealsNotifier.mealsList[index].fat)) {
                          return Card(
                              child: ListTile(
                            // leading: Image.network(
                            //   mealsNotifier.mealsList[index].image,
                            //   width: 120,
                            //   fit: BoxFit.fitWidth,
                            // ),
                            title: Text(mealsNotifier.mealsList[index].name),
                            subtitle: Text(mealsNotifier.mealsList[index].type),
                            onTap: () {
                              mealsNotifier.currentMeals =
                                  mealsNotifier.mealsList[index];
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return MealsDetail();
                              }));
                            },
                          ));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
