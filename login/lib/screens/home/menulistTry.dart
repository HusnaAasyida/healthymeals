import 'package:login/helpers/screen_navigation.dart';
import 'package:login/helpers/style.dart';
import 'package:login/models/menu.dart';
import 'package:login/notifier/category_notifier.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:login/screens/home/category.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/categories.dart';
import 'package:login/widgets/custom.dart';
import 'package:login/widgets/custom_text.dart';
import 'package:login/widgets/menu.dart';
import 'package:login/widgets/menutry.dart';
import 'package:provider/provider.dart';

class MenuList extends StatefulWidget {
  final MealModel mealModel;

  const MenuList({Key key, this.mealModel}) : super(key: key);
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final mealProvider = Provider.of<MealProvider>(context);

    // Future<void> _refreshList() async {
    //   getMeal(mealsNotifier);
    // }

    print("building Meals");
    return Scaffold(
      appBar: AppBar(
        title: Text("List Food"),
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
        ],
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
            title: Text(mealProvider.meals[index].name),
            onTap: () {
              // await mealProvider.loadMealsByCategory(
              //     categoryName: categoryProvider.categories[index].name);
              // changeScreen(
              //     context,
              //     CategoryScreen(
              //       categoryModel: categoryProvider.categories[index],
              //     ));
//               app.changeLoading();
            },
            // categoryProvider.currentMeals = mealsNotifier.mealsList[index];
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (BuildContext context) {
            //   return MealsDetail();
            // }));
          );
        },
        itemCount: mealProvider.meals.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     //final categoryProvider = Provider.of<CategoryProvider>(context);
//     final mealProvider = Provider.of<MealProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         elevation: 0.5,
//         backgroundColor: Colors.red,
//         title: CustomText(
//           text: "FoodApp",
//           color: Colors.white,
//         ),
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: <Widget>[
//             Divider(),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//                 height: 100,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: mealProvider.meals.length,
//                     itemBuilder: (context, index) {
//                       return MenuWidgetTry(
//                         meal: mealProvider.meals[index],
//                       );
//                     }))
//           ],
//         ),
//       ),
//     );
//   }
// }

//first
//             Container(
//               height: 100,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: mealProvider.meals.length,
//                   itemBuilder: (context, index) {
//                     return MenuWidgetTry(
//                       meal: mealProvider.meals[index],
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         elevation: 0.5,
//         backgroundColor: Colors.red[200],
//         title: CustomText(
//           text: "FoodApp",
//           color: Colors.white,
//         ),
//       ),
//       body: Container(
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: mealProvider.meals.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(6),
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     width: 140,
//                     height: 160,
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned.fill(
//                                 child: Align(
//                               alignment: Alignment.center,
//                               child: Loading(),
//                             )),
//                             // Center(
//                             //   child: FadeInImage.memoryNetwork(
//                             //       placeholder: kTransparentImage,
//                             //       image: category.image),
//                             // )
//                           ],
//                         )),
//                   ),
//                   Container(
//                     width: 140,
//                     height: 160,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           colors: [
//                             Colors.black.withOpacity(0.6),
//                             Colors.black.withOpacity(0.6),
//                             Colors.black.withOpacity(0.6),
//                             Colors.black.withOpacity(0.4),
//                             Colors.black.withOpacity(0.1),
//                             Colors.black.withOpacity(0.05),
//                             Colors.black.withOpacity(0.025),
//                           ],
//                         )),
//                   ),
//                   Positioned.fill(
//                       child: Align(
//                           alignment: Alignment.center,
//                           child: CustomText(
//                             text: mealProvider.meals[index].name,
//                             color: green,
//                             size: 26,
//                             weight: FontWeight.w300,
//                           )))
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
