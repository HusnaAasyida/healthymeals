import 'package:login/api/meals_api.dart';
import 'package:login/notifier/meals_notifier.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/screens/home/foodetails.dart';
import 'package:login/screens/home/meals_form.dart';
import 'package:login/screens/home/mealsdetails.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:provider/provider.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  final AuthService _auth = AuthService();
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

    Future<void> _refreshList() async {
      getMeal(mealsNotifier);
    }

    print("building Meals");
    return Scaffold(
      appBar: AppBar(
        title: Text("List Food"),
        backgroundColor: Colors.red[300],
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body:
          //Container(
          //   child: Column(children: <Widget>[
          ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // leading: Image.network(
            //   mealsNotifier.mealsList[index].image,
            //   width: 120,
            //   fit: BoxFit.fitWidth,
            // ),
            title: Text(mealsNotifier.mealsList[index].name),
            subtitle: Text(mealsNotifier.mealsList[index].category),
            onTap: () {
              mealsNotifier.currentMeals = mealsNotifier.mealsList[index];
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return FoodDetail();
              }));
            },
          );
        },
        itemCount: mealsNotifier.mealsList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mealsNotifier.currentMeals = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MealsForm(
                isUpdating: false,
              );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[300],
      ),
      //   SizedBox(
      //     height: 20,
      //   ),
      //   Align(
      //     alignment: Alignment.bottomCenter,
      //     child: RaisedButton(
      //         color: Colors.red[300],
      //         child: Text(
      //           'Next',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => CategoryList()),
      //           );
      //         }),
      //   ),
      // ]),
      //)
    );
  }
}

//
//           mealsNotifier.mealsList[index].image != null
//               ? mealsNotifier.mealsList[index].image
//               : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//
//         ),
