import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/models/user.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/categorylist.dart';
import 'package:login/services/database.dart';
import 'package:login/shared/loading.dart';
import 'package:login/widgets/container.dart';
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

class UserDetails extends StatefulWidget {
  @override
  _UserDetails createState() => _UserDetails();
}

class _UserDetails extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  //final List<String> sugars = ['0', '1', '2', '3', '4'];
  //final List<int> age = [17, 18, 19, 20, 21, 22, 23, 24, 25];

  // form values
  String _currentUsername;
  String _currentGender;
  String _currentWeight;
  String _currentHeight;
  int _currentAge;
  String image;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          if (userData.gender == 'male') {
            image = "assets/images/man.svg";
          } else {
            image = "assets/images/woman.svg";
          }

          return new Scaffold(
            backgroundColor: Colors.brown[50],
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(32),
              child: ShadowContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hi, ${userData.username}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),

                    //SizedBox(height: 30),

                    Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                        image,
                        fit: BoxFit.contain,
                      ),
                    ),

                    //username
                    SizedBox(height: 20),
                    Text(
                      'Username : ${userData.username}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    //age
                    SizedBox(height: 20),
                    Text(
                      'Age : ${userData.age}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    //gender
                    SizedBox(height: 20),
                    Text(
                      'Gender : ${userData.gender}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    //weight
                    SizedBox(height: 20),
                    Text(
                      'Weight : ${userData.weight}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Height : ${userData.height}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    SizedBox(height: 30),

                    // SizedBox(
                    //   height: 150,
                    // ),
                  ],
                ),
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
