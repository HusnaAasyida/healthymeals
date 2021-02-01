import 'package:login/models/user.dart';
import 'package:login/services/database.dart';
import 'package:login/shared/constants.dart';
import 'package:login/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  //final List<String> sugars = ['0', '1', '2', '3', '4'];
  //final List<int> age = [17, 18, 19, 20, 21, 22, 23, 24, 25];

  // form values
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your profile settings.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.username,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Username',
                        labelText: 'Username',
                      ),
                      validator: (val) => val.isEmpty ? 'New Username' : null,
                      onChanged: (val) =>
                          setState(() => _currentUsername = val),
                    ),
                    SizedBox(height: 10.0),

                    //age
                    TextFormField(
                      initialValue: userData.age.toString(),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Age',
                        labelText: 'Your Age',
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
                    // TextFormField(
                    //     //inputFormatters: userData.age,
                    //     initialValue: userData.age,
                    //     decoration: textInputDecoration.copyWith(hintText: 'Age'),
                    //     onChanged: (value) {
                    //       if (_currentAge != null) {
                    //         this._currentAge = value;
                    //       } else {
                    //         setState(() {
                    //           _currentAge = '';
                    //         });
                    //       }
                    //     }
                    // validator: (val) => val.isEmpty ? 'New Age' : null,
                    // onChanged: (val) => setState(() => _currentAge = val),
                    // ),
                    SizedBox(height: 10.0),

                    //gender
                    TextFormField(
                      initialValue: userData.gender,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Gender',
                        labelText: 'Gender',
                      ),
                      validator: (val) => val.isEmpty ? 'New Gender' : null,
                      onChanged: (val) => setState(() => _currentGender = val),
                    ),
                    SizedBox(height: 10.0),

                    //weight
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.weight.toString(),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Weight',
                        labelText: 'Weight (kg)',
                      ),
                      validator: (val) => val.isEmpty ? 'New Weight' : null,
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
                        hintText: 'Height',
                        labelText: 'Height (cm)',
                      ),
                      validator: (val) => val.isEmpty ? 'New Height' : null,
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

                    //bmistatus
                    // SizedBox(height: 20.0),
                    // TextFormField(
                    //   initialValue: userData.bmistatus,
                    //   decoration: textInputDecoration,
                    //   validator: (val) => val.isEmpty ? 'New Bmi Status' : null,
                    //   onChanged: (val) => setState(() => _currentBmi ),
                    // ),

                    // //calsneed
                    // SizedBox(height: 20.0),
                    // TextFormField(
                    //   initialValue: userData.calsneed,
                    //   decoration: textInputDecoration,
                    //   validator: (val) =>
                    //       val.isEmpty ? 'New Calories Needed' : null,
                    //   onChanged: (val) => setState(() => _currentCalsNeed = val),
                    // ),

                    // SizedBox(height: 10.0),
                    // Slider(
                    //   value: (_currentStrength ?? userData.strength).toDouble(),
                    //   activeColor: Colors.brown[_currentStrength ?? userData.strength],
                    //   inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                    //   min: 100.0,
                    //   max: 900.0,
                    //   divisions: 8,
                    //   onChanged: (val) => setState(() => _currentStrength = val.round()),
                    // ),
                    RaisedButton(
                        color: Colors.red[300],
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                                _currentUsername ?? snapshot.data.username,
                                _currentAge ?? snapshot.data.age,
                                _currentGender ?? snapshot.data.gender,
                                _currentWeight ?? snapshot.data.weight,
                                _currentHeight ?? snapshot.data.height,
                                _currentBmi ?? snapshot.data.bmi,
                                _currentComments ?? snapshot.data.comments,
                                _currentCalories ?? snapshot.data.calories,
                                _currentCarbs ?? snapshot.data.carbsUser,
                                _currentProtein ?? snapshot.data.proteinUser,
                                _currentFat ?? snapshot.data.fatUser,
                                _currentCarbsPerDay ??
                                    snapshot.data.carbsPerDay,
                                _currentProteinPerDay ??
                                    snapshot.data.proteinPerDay,
                                _currentFatPerDay ?? snapshot.data.fatPerDay);
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
