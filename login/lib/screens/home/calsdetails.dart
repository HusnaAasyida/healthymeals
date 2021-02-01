import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/models/calc.dart';
import 'package:login/models/details.dart';
import 'package:login/models/user.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:login/shared/constants.dart';
import 'package:login/screens/home/home.dart';
import 'package:provider/provider.dart';

class CalsDetails extends StatefulWidget {
  @override
  _CalsDetailsState createState() => _CalsDetailsState();
}

class _CalsDetailsState extends State<CalsDetails> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _currentUsername;
  String _currentGender;
  double _currentWeight;
  double _currentHeight;
  int _currentAge;
  double _currentBmi;
  String _currentComments;
  double _currentCalories;

  double _calcFemale;
  double _calcMale;
  double _calcActs;
  int _currentCarbs;
  int _currentProtein;
  int _currentFat;
  TextEditingController _actsFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
                key: _formKey,
                child: Scaffold(
                  backgroundColor: Colors.brown[50],
                  appBar: AppBar(
                    title: Text("Calories Details"),
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
                  body: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 120,
                            width: 120,
                            child: SvgPicture.asset(
                              "assets/images/happy.svg",
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Your Current Calories : ",
                            style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    userData.calories.toString(),
                                    style: new TextStyle(
                                        color: Colors.brown[300],
                                        fontSize: 44.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown[100],
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(children: [
                                            Text(
                                              'Carbohydrate',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '50%',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                        ])),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown[100],
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(children: [
                                            Text(
                                              'Protein',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '25%',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                        ])),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown[100],
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(children: [
                                            Text(
                                              'Fat',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '25%',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                        ])),
                              ]),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown[100],
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(children: [
                                            Text(
                                              'Per Day',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Carbohydrate : ${userData.carbsPerDay}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Protein: ${userData.carbsPerDay}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Fat: ${userData.fatPerDay}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                        ])),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown[100],
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(children: [
                                            Text(
                                              'Per Meal',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Carbohydrates: ${userData.carbsUser}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Protein: ${userData.proteinUser}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Fat: ${userData.fatUser}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                        ])),
                              ]),
                          SizedBox(height: 170),
                        ],
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}
