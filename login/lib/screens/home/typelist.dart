import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/screen_navigation.dart';
import 'package:login/helpers/style.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/notifier/types_notifier.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/services/auth.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/types.dart';
import 'package:login/widgets/custom_text.dart';

import 'package:provider/provider.dart';

class TypeList extends StatefulWidget {
  @override
  _TypeListState createState() => _TypeListState();
}

class _TypeListState extends State<TypeList> {
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: typeProvider.types.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
//                              app.changeLoading();
                                await mealProvider.loadMealsByType(
                                    typeName: typeProvider.types[index].name);

                                changeScreen(context, CategoryList());

//                              app.changeLoading();
                              },
                              child: TypeWidget(
                                type: typeProvider.types[index],
                              ));
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
