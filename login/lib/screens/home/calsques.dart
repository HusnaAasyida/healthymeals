import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/models/calc.dart';
import 'package:login/models/details.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/home/calsdetails.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:login/shared/constants.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
  double _calcActsRound;
  int _currentCarbs;
  int _currentProtein;
  int _currentFat;
  double _currentCarbsPerDay;
  double _currentProteinPerDay;
  double _currentFatPerDay;
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
                  appBar: AppBar(
                    title: Text("Calories Calculator"),
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
                          // Container(
                          //   height: 150,
                          //   width: 150,
                          //   child: SvgPicture.asset(
                          //     "assets/images/calories-calulator.svg",
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Text(
                            "Calories Calculator",
                            style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "We care about your health",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 32,
                          ),

                          //age
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.age.toString(),
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Age',
                              hintText: 'Age',
                              icon: new Icon(Icons.calendar_today),
                            ),
                            validator: (val) => val.isEmpty ? 'New Age' : null,
                            onChanged: (val) {
                              if (val.isEmpty) {
                                setState(() => _currentAge = 0);
                              } else {
                                setState(() {
                                  _currentAge = int.parse(val);
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //gender
                          TextFormField(
                            initialValue: userData.gender,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Gender',
                              hintText: 'Gender',
                              icon: new Icon(Icons.pregnant_woman),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'New Gender' : null,
                            onChanged: (val) =>
                                setState(() => _currentGender = val),
                          ),

                          //weight
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.weight.toString(),
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Weight',
                              hintText: 'Weight',
                              icon: new Icon(Icons.perm_data_setting),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'New Weight' : null,
                            onChanged: (val) {
                              if (val.isEmpty) {
                                setState(() => _currentWeight = 0.0);
                              } else {
                                setState(() {
                                  _currentWeight = double.parse(val);
                                });
                              }
                            },
                          ),

                          //height
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.height.toString(),
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Height',
                              hintText: 'Height',
                              icon: new Icon(Icons.calendar_view_day),
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'New Height' : null,
                            onChanged: (val) {
                              if (val.isEmpty) {
                                setState(() => _currentHeight = 0.0);
                              } else {
                                setState(() {
                                  _currentHeight = double.parse(val);
                                });
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          new TextFormField(
                            controller: _actsFieldController,
                            keyboardType: TextInputType.number,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Number Level',
                              hintText: 'Number Level',
                              icon: new Icon(Icons.accessibility),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red[50],
                            ),
                            padding: EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(children: [
                                    Text('Level 1 : No exercise'),
                                    Text('Level 2: 1-3 days a week'),
                                    Text('Level 3: 3-5 days a week'),
                                    Text('Level 4: Hard exercise every day'),
                                  ]),
                                ]),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                              alignment: Alignment.topCenter,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Your Calories :',
                                    style: new TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  new Text(
                                    _calcActsRound != null
                                        ? '$_calcActsRound'
                                        : '',
                                    style: new TextStyle(
                                        color: Colors.red[200],
                                        fontSize: 44.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            child: FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (userData.gender == "female" ||
                                      userData.gender == "Female") {
                                    _calcFemale = ((10 *
                                            userData.weight.toDouble()) +
                                        (6.25 * userData.height.toDouble()) -
                                        (5 * userData.age.toInt()) -
                                        161);

                                    if (_actsFieldController.text == "1") {
                                      _calcActs = _calcFemale * 1.2;
                                    } else if (_actsFieldController.text ==
                                        "2") {
                                      _calcActs = _calcFemale * 1.375;
                                    } else if (_actsFieldController.text ==
                                        "3") {
                                      _calcActs = _calcFemale * 1.55;
                                    } else if (_actsFieldController.text ==
                                        "4") {
                                      _calcActs = _calcFemale * 1.725;
                                    }
                                  } else if (userData.gender == "male" ||
                                      userData.gender == "Male") {
                                    _calcMale = (5 +
                                        (10 * userData.weight.toDouble()) +
                                        (6.25 * userData.height.toDouble()) -
                                        (5 * userData.age.toInt()));

                                    if (_actsFieldController.text == "1") {
                                      _calcActs = _calcMale * 1.2;
                                    } else if (_actsFieldController.text ==
                                        "2") {
                                      _calcActs = _calcMale * 1.375;
                                    } else if (_actsFieldController.text ==
                                        "3") {
                                      _calcActs = _calcMale * 1.55;
                                    } else if (_actsFieldController.text ==
                                        "4") {
                                      _calcActs = _calcMale * 1.725;
                                    }
                                  }
                                  _calcActsRound = _calcActs.roundToDouble();
                                  _currentCalories = _calcActs.roundToDouble();

                                  _currentCarbsPerDay =
                                      ((_currentCalories * 0.50) / 4)
                                          .roundToDouble();
                                  _currentProteinPerDay =
                                      ((_currentCalories * 0.25) / 4)
                                          .roundToDouble();
                                  _currentFatPerDay =
                                      ((_currentCalories * 0.25) / 4)
                                          .roundToDouble();

                                  _currentCarbs =
                                      (_currentCarbsPerDay / 3).round();
                                  _currentProtein =
                                      (_currentProteinPerDay / 3).round();
                                  _currentFat = (_currentFatPerDay / 3).round();
                                });
                              },
                              icon: Icon(
                                Icons.donut_large,
                                color: Colors.white,
                              ),
                              label: Text("Calculate"),
                              textColor: Colors.white,
                              color: Colors.red[300],
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 120, right: 120),
                          ),

                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.red[300],
                              child: Text(
                                '         Update        ',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: user.uid)
                                      .updateUserData(
                                          _currentUsername ??
                                              snapshot.data.username,
                                          _currentAge ?? snapshot.data.age,
                                          _currentGender ??
                                              snapshot.data.gender,
                                          _currentWeight ??
                                              snapshot.data.weight,
                                          _currentHeight ??
                                              snapshot.data.height,
                                          _currentBmi ?? snapshot.data.bmi,
                                          _currentComments ??
                                              snapshot.data.comments,
                                          _currentCalories ??
                                              snapshot.data.calories,
                                          _currentCarbs ??
                                              snapshot.data.carbsUser,
                                          _currentProtein ??
                                              snapshot.data.proteinUser,
                                          _currentFat ?? snapshot.data.fatUser,
                                          _currentCarbsPerDay ??
                                              snapshot.data.carbsPerDay,
                                          _currentProteinPerDay ??
                                              snapshot.data.proteinPerDay,
                                          _currentFatPerDay ??
                                              snapshot.data.fatPerDay);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalsDetails()),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}
