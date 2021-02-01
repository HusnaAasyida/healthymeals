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

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
                    margin: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                    padding: EdgeInsets.all(30),

                    //height: 100,
                    child: GridView.builder(
                        itemCount: categoryProvider.categories.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                            child: new Card(
                              elevation: 5.0,
                              child: new Container(
                                alignment: Alignment.centerLeft,
                                margin: new EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 10.0),
                                child: new Text(
                                  categoryProvider.categories[index].name
                                      .toString(),
                                ),
                              ),
                            ),
                            onTap: () async {
                              await mealProvider.loadMealsByCategory(
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
