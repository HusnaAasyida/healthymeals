import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/helpers/constant.dart';
import 'package:login/helpers/screen_navigation.dart';
import 'package:login/screens/home/bmiques.dart';
import 'package:login/screens/home/calsdetails.dart';
import 'package:login/screens/home/calsques.dart';
import 'package:login/screens/home/categorybreakfast.dart';
import 'package:login/screens/home/categorydinner.dart';
import 'package:login/screens/home/categorylunch.dart';
import 'package:login/screens/home/filterlist.dart';
import 'package:login/screens/home/food.dart';
import 'package:login/screens/home/momentlist.dart';
import 'package:login/screens/home/userHome.dart';
import 'package:login/screens/home/user_details.dart';
import 'package:login/services/auth.dart';
import 'package:login/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Colors.red[300],
          elevation: 0.0,
          actions: <Widget>[
            // FlatButton.icon(
            //   icon: Icon(Icons.person),
            //   label: Text('Logout'),
            //   onPressed: () async {
            //     await _auth.signOut();
            //   },
            // ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  changeScreen(context, Home());
                },
                leading: Icon(Icons.home),
                title: CustomText(text: "Profile"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, CategoryBList());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Breakfast"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, CategoryLList());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Lunch"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, CategoryDList());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Dinner"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, BMICalculatorScreen());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "BMI Calculator"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, Calculator());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Calories Calculator"),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, Filter());
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Filter"),
              ),
              // ListTile(
              //   onTap: () {
              //     changeScreen(context, Food());
              //   },
              //   leading: Icon(Icons.arrow_right),
              //   title: CustomText(text: "Foods"),
              // ),
              ListTile(
                onTap: () async {
                  await _auth.signOut();
                },
                leading: Icon(Icons.arrow_right),
                title: CustomText(text: "Logout"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "profile",
                                child: Image.asset(
                                    "assets/images/business-person.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Profile",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("Update your details first!!",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 2),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "breakfast",
                                child: Image.asset("assets/images/bread.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Breakfast",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("Breakfast is important!  ",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryBList()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "lunch",
                                child:
                                    SvgPicture.asset("assets/images/lunch.svg"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Lunch",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("   It's lunch time!              ",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryLList()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 2),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "dinner",
                                child: Image.asset("assets/images/soup.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Dinner",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("Let's enjoy you dinner!   ",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryDList()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "bmi",
                                child: Image.asset("assets/images/bmi.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("BMI",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("Let's calculate your BMI",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BMICalculatorScreen()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 2),

                          padding: EdgeInsets.all(15),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "filter",
                                child: SvgPicture.asset(
                                    "assets/images/calories-calculator.svg"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Calories",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("  Let's see your calories    ",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calculator()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 60),

                          padding: EdgeInsets.all(18),

                          // For  demo we use fixed height  and width
                          // Now we dont need them
                          // height: 180,
                          // width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "meals",
                                child: Image.asset("assets/images/list.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Meals",
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text("We suggest you the best",
                                  style: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Filter()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));

    // SafeArea(

    //   child: ListView(
    //     children: <Widget>[
    //       InkWell(
    //         child: Container(
    //           margin: EdgeInsets.symmetric(vertical: 20),
    //           padding: EdgeInsets.all(10),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             color: Colors.red[50],
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(0, 17),
    //                 blurRadius: 23,
    //                 spreadRadius: -13,
    //                 color: Colors.grey,
    //               ),
    //             ],
    //           ),
    //           child: Row(
    //             children: <Widget>[
    //               SvgPicture.asset("assets/images/lunch.svg",
    //                   fit: BoxFit.contain),
    //               SizedBox(width: 20),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text("Breakfast",
    //                         style: new TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600)),
    //                     Text("Breakfast is important! Don't skip!",
    //                         style: new TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         onTap: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => CategoryBList()));
    //         },
    //       ),
    //       InkWell(
    //         child: Container(
    //           margin: EdgeInsets.symmetric(vertical: 20),
    //           padding: EdgeInsets.all(10),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             color: Colors.red[50],
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(0, 17),
    //                 blurRadius: 23,
    //                 spreadRadius: -13,
    //                 color: Colors.grey,
    //               ),
    //             ],
    //           ),
    //           child: Row(
    //             children: <Widget>[
    //               SvgPicture.asset("assets/images/lunch.svg",
    //                   fit: BoxFit.contain),
    //               SizedBox(width: 20),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text("Lunch",
    //                         style: new TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600)),
    //                     Text("It's lunch time! Choose your favourite",
    //                         style: new TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         onTap: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => CategoryLList()));
    //         },
    //       ),
    //       InkWell(
    //         child: Container(
    //           margin: EdgeInsets.symmetric(vertical: 20),
    //           padding: EdgeInsets.all(10),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             color: Colors.red[50],
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(0, 17),
    //                 blurRadius: 23,
    //                 spreadRadius: -13,
    //                 color: Colors.grey,
    //               ),
    //             ],
    //           ),
    //           child: Row(
    //             children: <Widget>[
    //               SvgPicture.asset("assets/images/lunch.svg",
    //                   fit: BoxFit.contain),
    //               SizedBox(width: 20),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text("Dinner",
    //                         style: new TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600)),
    //                     Text("Let's enjoy your dinner!",
    //                         style: new TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         onTap: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => CategoryDList()));
    //         },
    //       ),
    //       InkWell(
    //         child: Container(
    //           margin: EdgeInsets.symmetric(vertical: 20),
    //           padding: EdgeInsets.all(10),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             color: Colors.red[50],
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(0, 17),
    //                 blurRadius: 23,
    //                 spreadRadius: -13,
    //                 color: Colors.grey,
    //               ),
    //             ],
    //           ),
    //           child: Row(
    //             children: <Widget>[
    //               SvgPicture.asset(
    //                 "assets/images/heart.svg",
    //               ),
    //               SizedBox(width: 20),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text("BMI",
    //                         style: new TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600)),
    //                     Text(
    //                         "Let's calculate your BMI to see if you are fit!",
    //                         style: new TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         onTap: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => BMICalculatorScreen()));
    //         },
    //       ),
    //       InkWell(
    //         child: Container(
    //           margin: EdgeInsets.symmetric(vertical: 20),
    //           padding: EdgeInsets.all(10),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             color: Colors.red[50],
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(0, 17),
    //                 blurRadius: 23,
    //                 spreadRadius: -13,
    //                 color: Colors.grey,
    //               ),
    //             ],
    //           ),
    //           child: Row(
    //             children: <Widget>[
    //               SvgPicture.asset(
    //                 "assets/images/calories-calculator.svg",
    //               ),
    //               SizedBox(width: 20),
    //               Expanded(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text("Calories",
    //                         style: new TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w600)),
    //                     Text(
    //                         "Let's calculate your calories to see meals that suitable for you!",
    //                         style: new TextStyle(
    //                             color: Colors.grey,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         onTap: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => Calculator()));
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    // );
  }
}
