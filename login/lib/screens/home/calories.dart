import 'package:login/helpers/style.dart';
import 'package:login/models/calories.dart';
import 'package:login/notifier/menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/menulistTry.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/custom.dart';
import 'package:login/widgets/custom_text.dart';
import 'package:login/widgets/menu.dart';
import 'package:provider/provider.dart';

class CalorieScreen extends StatelessWidget {
  final CalorieModel calorieModel;

  const CalorieScreen({Key key, this.calorieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Align(
                alignment: Alignment.center,
                child: Loading(),
              )),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                // child: FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image: calorieModel.image,
                //   height: 160,
                //   fit: BoxFit.fill,
                //   width: double.infinity,
                // ),
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(30),
//                      bottomRight: Radius.circular(30),
//                    ),
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                )),
              ),
              Positioned.fill(
                  bottom: 40,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomText(
                        text: calorieModel.caloriestot.toString(),
                        color: green,
                        size: 26,
                        weight: FontWeight.w300,
                      ))),
              Positioned.fill(
                  top: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: black.withOpacity(0.2)),
                            child: Icon(
                              Icons.close,
                              color: white,
                            )),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: mealProvider.mealsByCalories
                .map((item) => GestureDetector(
                      onTap: () {
                        //changeScreen(context,Details(meal: item,));
                      },
                      child: MealWidget(
                        meal: item,
                      ),
                    ))
                .toList(),
          )
        ],
      )),
    );
  }
}
