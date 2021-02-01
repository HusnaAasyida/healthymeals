import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/screen_navigation.dart';
import 'package:login/helpers/style.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/home/category.dart';
import 'package:login/services/auth.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/categories.dart';
import 'package:login/widgets/custom_text.dart';

import 'package:provider/provider.dart';

class CategoryDList extends StatefulWidget {
  @override
  _CategoryDListState createState() => _CategoryDListState();
}

class _CategoryDListState extends State<CategoryDList> {
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
      backgroundColor: Colors.brown[50],
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
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(40),
                    height: 800,
                    child: GridView.builder(
                        itemCount: categoryProvider.categories.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                            child: new Card(
                              color: Colors.brown[100],
                              elevation: 10.0,
                              child: new Container(
                                alignment: Alignment.centerLeft,
                                margin: new EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 10.0,
                                    right: 10.0),
                                child: new Text(
                                  categoryProvider.categories[index].name
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            onTap: () async {
                              await mealProvider.loadMealsByCategory3(
                                  categoryName:
                                      categoryProvider.categories[index].name);
                              changeScreen(
                                  context,
                                  CategoryScreen(
                                    categoryModel:
                                        categoryProvider.categories[index],
                                  ));
                            },
                            // child: CategoryWidget(
                            //   category: categoryProvider.categories[index],
                            // ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
