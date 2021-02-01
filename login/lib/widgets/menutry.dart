import 'package:flutter/material.dart';
import 'package:login/models/menu.dart';
import 'package:login/shared/loading.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class MenuWidgetTry extends StatelessWidget {
  final MealModel meal;
  const MenuWidgetTry({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categoryProvider.categories.length,
//           itemBuilder: (_, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     decoration: BoxDecoration(color: white, boxShadow: [
//                       BoxShadow(
//                         color: Colors.red[50],
//                         offset: Offset(4, 6),
//                         blurRadius: 20,
//                       ),
//                     ]),
//                     child: Padding(
//                       padding: EdgeInsets.all(4),
//                       //child: Image(image: null),)
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   CustomText(
//                     text: category.name,
//                     size: 14,
//                     color: green,
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                //child: Image.network(category.name)
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    )),
                    // Center(
                    //   child: FadeInImage.memoryNetwork(
                    //       placeholder: kTransparentImage,
                    //       image: category.image),
                    // )
                  ],
                )),
          ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
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
              child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: meal.name,
                    color: green,
                    size: 26,
                    weight: FontWeight.w300,
                  ))),
          // SizedBox(
          //   height: 20,
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: RaisedButton(
          //       color: Colors.red[300],
          //       child: Text(
          //         'Next',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => Story()),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
