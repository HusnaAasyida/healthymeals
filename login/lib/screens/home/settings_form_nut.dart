import 'package:login/models/nutris.dart';
import 'package:login/models/user.dart';
import 'package:login/services/database.dart';
import 'package:login/services/database2.dart';
import 'package:login/shared/constants.dart';
import 'package:login/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsFormNut extends StatefulWidget {
  @override
  _SettingsFormNutState createState() => _SettingsFormNutState();
}

class _SettingsFormNutState extends State<SettingsFormNut> {
  final _formKey = GlobalKey<FormState>();
  //final List<String> sugars = ['0', '1', '2', '3', '4'];
  //final List<int> age = [17, 18, 19, 20, 21, 22, 23, 24, 25];

  // form values
  String _currentUsername;
  String _currentGender;
  int _currentAge;
  String _currentPhone;
  String _currentWork;
  String _currentCertified;

  @override
  Widget build(BuildContext context) {
    Nutris nutris = Provider.of<Nutris>(context);

    return StreamBuilder<NutrisData>(
        stream: DatabaseService2(uid: nutris.uid).nutrisData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            NutrisData nutrisData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your profile settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: nutrisData.username,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Username'),
                    validator: (val) => val.isEmpty ? 'New Username' : null,
                    onChanged: (val) => setState(() => _currentUsername = val),
                  ),
                  SizedBox(height: 10.0),

                  //age
                  TextFormField(
                    initialValue: nutrisData.age.toString(),
                    decoration: textInputDecoration.copyWith(hintText: 'Age'),
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
                    initialValue: nutrisData.gender,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Gender'),
                    validator: (val) => val.isEmpty ? 'New Gender' : null,
                    onChanged: (val) => setState(() => _currentGender = val),
                  ),
                  SizedBox(height: 10.0),

                  //gender
                  TextFormField(
                    initialValue: nutrisData.phone,
                    decoration: textInputDecoration.copyWith(hintText: 'Phone'),
                    validator: (val) => val.isEmpty ? 'New Phone' : null,
                    onChanged: (val) => setState(() => _currentPhone = val),
                  ),
                  SizedBox(height: 10.0),

                  //gender
                  TextFormField(
                    initialValue: nutrisData.work,
                    decoration: textInputDecoration.copyWith(hintText: 'Work'),
                    validator: (val) => val.isEmpty ? 'New Work' : null,
                    onChanged: (val) => setState(() => _currentWork = val),
                  ),
                  SizedBox(height: 10.0),

                  //gender
                  TextFormField(
                    initialValue: nutrisData.certified,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Certified'),
                    validator: (val) => val.isEmpty ? 'New Certified' : null,
                    onChanged: (val) => setState(() => _currentCertified = val),
                  ),
                  SizedBox(height: 10.0),

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
                          await DatabaseService2(uid: nutris.uid).updateNutData(
                            _currentUsername ?? snapshot.data.username,
                            _currentAge ?? snapshot.data.age,
                            _currentGender ?? snapshot.data.gender,
                            _currentPhone ?? snapshot.data.phone,
                            _currentWork ?? snapshot.data.work,
                            _currentCertified ?? snapshot.data.certified,
                          );
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
