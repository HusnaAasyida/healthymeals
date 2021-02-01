import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/models/nutris.dart';
import 'package:login/models/user.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/services/database.dart';
import 'package:login/services/database2.dart';
import 'package:login/shared/loading.dart';
import 'package:provider/provider.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: new Stack(
//       children: <Widget>[
//         ClipPath(
//           child: Container(color: Colors.black.withOpacity(0.8)),
//           clipper: getClipper(),
//         ),
//         Positioned(
//             width: 350.0,
//             top: MediaQuery.of(context).size.height / 5,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     width: 150.0,
//                     height: 150.0,
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         image: DecorationImage(
//                             image: NetworkImage(
//                                 'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
//                             fit: BoxFit.cover),
//                         borderRadius: BorderRadius.all(Radius.circular(75.0)),
//                         boxShadow: [
//                           BoxShadow(blurRadius: 7.0, color: Colors.black)
//                         ])),
//                 SizedBox(height: 90.0),
//                 Text(
//                   'Tom Cruise',
//                   style: TextStyle(
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Montserrat'),
//                 ),
//                 SizedBox(height: 15.0),
//                 Text(
//                   'Subscribe guys',
//                   style: TextStyle(
//                       fontSize: 17.0,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Montserrat'),
//                 ),
//                 SizedBox(height: 25.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Container(
//                         height: 30.0,
//                         width: 95.0,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.greenAccent,
//                           color: Colors.green,
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Center(
//                               child: Text(
//                                 'Edit Name',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         )),
//                     Container(
//                         height: 30.0,
//                         width: 95.0,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.blueAccent,
//                           color: Colors.blue,
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Center(
//                               child: Text(
//                                 'Edit Photo',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         )),
//                     Container(
//                         height: 30.0,
//                         width: 95.0,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.redAccent,
//                           color: Colors.red,
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Center(
//                               child: Text(
//                                 'Log out',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         ))
//                   ],
//                 )
//               ],
//             ))
//       ],
//     ));
//   }
// }

// class getClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = new Path();

//     path.lineTo(0.0, size.height / 1.9);
//     path.lineTo(size.width + 125, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }

//sama macam setting form

class NutrisDetails extends StatefulWidget {
  @override
  _NutrisDetails createState() => _NutrisDetails();
}

class _NutrisDetails extends State<NutrisDetails> {
  final _formKey = GlobalKey<FormState>();
  //final List<String> sugars = ['0', '1', '2', '3', '4'];
  //final List<int> age = [17, 18, 19, 20, 21, 22, 23, 24, 25];

  // form values
  String _currentUsername;
  String _currentGender;
  String _currentWeight;
  String _currentHeight;
  int _currentAge;

  @override
  Widget build(BuildContext context) {
    Nutris nutris = Provider.of<Nutris>(context);

    return StreamBuilder<NutrisData>(
      stream: DatabaseService2(uid: nutris.uid).nutrisData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          NutrisData nutrisData = snapshot.data;

          return new Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 180,
                    width: 180,
                    child: SvgPicture.asset(
                      "assets/images/man.svg",
                      fit: BoxFit.contain,
                    ),
                  ),

                  //username
                  SizedBox(height: 30),
                  Text(
                    'Username : ${nutrisData.username}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  //age
                  SizedBox(height: 20),
                  Text(
                    'Age : ${nutrisData.age}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  //gender
                  SizedBox(height: 20),
                  Text(
                    'Gender : ${nutrisData.gender}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  //weight
                  SizedBox(height: 20),
                  Text(
                    'Phone : ${nutrisData.phone}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Height : ${nutrisData.work}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(
                    height: 250,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                        color: Colors.red[300],
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryList()),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}

//macam meals

//             return Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     'Update your profile settings.',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.username,
//                     decoration:
//                         textInputDecoration.copyWith(hintText: 'Username'),
//                     validator: (val) => val.isEmpty ? 'New Username' : null,
//                     onChanged: (val) => setState(() => _currentUsername = val),
//                   ),
//                   SizedBox(height: 10.0),

//                   //gender
//                   TextFormField(
//                     initialValue: userData.gender,
//                     decoration:
//                         textInputDecoration.copyWith(hintText: 'Gender'),
//                     validator: (val) => val.isEmpty ? 'New Gender' : null,
//                     onChanged: (val) => setState(() => _currentGender = val),
//                   ),
//                   SizedBox(height: 10.0),

//                   //weight
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.weight,
//                     decoration:
//                         textInputDecoration.copyWith(hintText: 'Weight'),
//                     validator: (val) => val.isEmpty ? 'New Weight' : null,
//                     onChanged: (val) => setState(() => _currentWeight = val),
//                   ),

//                   //height
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.height,
//                     decoration:
//                         textInputDecoration.copyWith(hintText: 'Height'),
//                     validator: (val) => val.isEmpty ? 'New Height' : null,
//                     onChanged: (val) => setState(() => _currentHeight = val),
//                   ),

//                   RaisedButton(
//                       color: Colors.pink[400],
//                       child: Text(
//                         'Update',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () async {
//                         if (_formKey.currentState.validate()) {
//                           await DatabaseService(uid: user.uid).updateUserData(
//                             _currentUsername ?? snapshot.data.username,
//                             //_currentAge ?? snapshot.data.age,
//                             _currentGender ?? snapshot.data.gender,
//                             _currentWeight ?? snapshot.data.weight,
//                             _currentHeight ?? snapshot.data.height,
//                           );
//                           Navigator.pop(context);
//                         }
//                       }),
//                 ],
//               ),
//             );
//           } else {
//             return Loading();
//           }
//         });
//   }
// }

//asal

// class DetailsList extends StatefulWidget {
//   @override
//   _DetailsListState createState() => _DetailsListState();
// }

// class _DetailsListState extends State<DetailsList> {
//   @override
//   Widget build(BuildContext context) {
//     final details = Provider.of<List<Details>>(context) ?? [];

//     return ListView.builder(
//       itemCount: details.length,
//       itemBuilder: (context, index) {
//         return DetailsTile(details: details[index]);
//       },
//     );
//   }
// }

//try

// class UserDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     DetailsNotifier detailsNotifier =
//         Provider.of<DetailsNotifier>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(detailsNotifier.currentDetails.username),
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               // Image.network(
//               //   mealsNotifier.currentMeals.image),

//               //name of meals
//               SizedBox(height: 24),
//               Text(
//                 detailsNotifier.currentDetails.username,
//                 style: TextStyle(
//                   fontSize: 26,
//                 ),
//               ),

//               //category of details
//               SizedBox(height: 16),
//               Text(
//                 'Category: ${detailsNotifier.currentDetails.gender}',
//                 style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
//               ),

//               //type of details
//               SizedBox(height: 16),
//               Text(
//                 'Type: ${detailsNotifier.currentDetails.weight}',
//                 style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
//               ),

//               //calories of details
//               SizedBox(height: 16),
//               Text(
//                 'Calories: ${detailsNotifier.currentDetails.height}',
//                 style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
