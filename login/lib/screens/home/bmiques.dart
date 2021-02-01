import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/models/calc.dart';
import 'package:login/models/details.dart';
import 'package:login/models/user.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:login/shared/constants.dart';
import 'package:provider/provider.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  double _bmi;
  double _bminew1;
  double _bminew2;
  double _bminew3;
  String _currentUsername;
  String _currentGender;
  double _currentWeight;
  double _currentHeight;
  int _currentAge;
  double _currentBmi;
  String _currentComments;
  double _currentCalories;
  int _currentCarbs;
  int _currentProtein;
  int _currentFat;
  double _currentCarbsPerDay;
  double _currentProteinPerDay;
  double _currentFatPerDay;

  double calspercarbs;
  double calsperprotein;
  double calsperfat;

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
                  // backgroundColor: Colors.red[50],
                  appBar: AppBar(
                    title: Text("BMI Calculator"),
                    backgroundColor: Colors.red[300],
                    elevation: 0.0,
                    actions: <Widget>[],
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
                              "assets/images/bathroom-scale.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "BMI Calculator",
                            style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 20,
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

                          //weight
                          SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: userData.weight.toString(),
                            decoration: textInputDecoration.copyWith(
                                labelText: 'Weight',
                                hintText: 'Weight',
                                icon: new Icon(Icons.perm_data_setting),
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
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
                          SizedBox(
                            height: 32,
                          ),

                          Container(
                              alignment: Alignment.topCenter,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    _currentBmi != null
                                        ? 'BMI : $_currentBmi'
                                        : '',
                                    style: new TextStyle(
                                        color: Colors.red[200],
                                        fontSize: 44.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  new Text(
                                    _currentComments != null
                                        ? ' $_currentComments'
                                        : '',
                                    style: new TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),

                          SizedBox(
                            height: 32,
                          ),

                          Container(
                            child: FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(18.0),
                                  ),
                              onPressed: () {
                                setState(() {
                                  if (userData.weight != null &&
                                      userData.height != null) {
                                    _bmi = userData.weight /
                                        ((userData.height / 100) *
                                            (userData.height / 100));
                                  } else if (userData.weight == null &&
                                      userData.height == null) {
                                    _bminew1 = _currentWeight /
                                        ((_currentHeight / 100) *
                                            (_currentHeight / 100));
                                  }

                                  // _bminew2 = userData.weight /
                                  //     ((_currentHeight / 100) *
                                  //         (_currentHeight / 100));

                                  // _bminew3 = _currentWeight /
                                  //     ((userData.height / 100) *
                                  //         (userData.height / 100));

                                  if (_bmi >= 18.5 && _bmi <= 25) {
                                    _currentBmi = _bmi.roundToDouble();
                                    _currentComments = "You are Totaly Fit";
                                  } else if (_bmi < 18.5) {
                                    _currentBmi = _bmi.roundToDouble();
                                    _currentComments = "You are Underweighted";
                                  } else if (_bmi > 25 && _bmi <= 30) {
                                    _currentBmi = _bmi.roundToDouble();
                                    _currentComments = "You are Overweighted";
                                  } else if (_bmi > 30) {
                                    _currentBmi = _bmi.roundToDouble();
                                    _currentComments = "You are Obesed";
                                  } else if (_bminew1 >= 18.5 &&
                                      _bminew1 <= 25) {
                                    _currentBmi = _bminew1.roundToDouble();
                                    _currentComments = "You are Totaly Fit";
                                  } else if (_bminew1 < 18.5) {
                                    _currentBmi = _bminew1.roundToDouble();
                                    _currentComments = "You are Underweighted";
                                  } else if (_bminew1 > 25 && _bminew1 <= 30) {
                                    _currentBmi = _bminew1.roundToDouble();
                                    _currentComments = "You are Overweighted";
                                  } else if (_bminew1 > 30) {
                                    _currentBmi = _bminew1.roundToDouble();
                                    _currentComments = "You are Obesed";
                                  }
                                 
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

                          SizedBox(
                            height: 20,
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
                                  Navigator.pop(context);
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
