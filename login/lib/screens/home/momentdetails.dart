import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/api/moments_api.dart';
import 'package:login/models/details.dart';
import 'package:login/models/moments.dart';
import 'package:login/notifier/moments_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/database.dart';
import 'package:provider/provider.dart';

import 'moments_form.dart';

class MomentsDetail extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    MomentsNotifier momentsNotifier = Provider.of<MomentsNotifier>(context);

    _onMomentsDeleted(Moments moments) {
      Navigator.pop(context);
      momentsNotifier.deleteMoments(moments);
    }

    return StreamProvider<List<Details>>.value(
      value: DatabaseService().details,
      child: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: Text(momentsNotifier.currentMoments.name),
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
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(
                    "assets/images/soup.svg",
                    fit: BoxFit.contain,
                  ),
                ),

                //name of moments
                SizedBox(height: 24),
                Text(
                  momentsNotifier.currentMoments.name,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),

                //category of moments
                SizedBox(height: 16),
                Text(
                  'Category: ${momentsNotifier.currentMoments.category}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //type of moments
                SizedBox(height: 16),
                Text(
                  'Type: ${momentsNotifier.currentMoments.type}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //type of moments
                SizedBox(height: 16),
                Text(
                  'Type: ${momentsNotifier.currentMoments.serving}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),

                //minutes of moments
                SizedBox(height: 16),
                Text(
                  'Description: ${momentsNotifier.currentMoments.description}',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'button1',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MomentsForm(
                      isUpdating: true,
                    );
                  }),
                );
              },
              child: Icon(Icons.edit),
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: 'button2',
              onPressed: () => deleteMoments(
                  momentsNotifier.currentMoments, _onMomentsDeleted),
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
// width: MediaQuery.of(context).size.width,
// height: 250,
// fit: BoxFit.fitWidth,

//     floatingActionButton: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         FloatingActionButton(
//           heroTag: 'button1',
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (BuildContext context) {
//                 return MomentsForm(
//                   isUpdating: true,
//                 );
//               }),
//             );
//           },
//           child: Icon(Icons.edit),
//           foregroundColor: Colors.white,
//         ),
//         SizedBox(height: 20),
//         FloatingActionButton(
//           heroTag: 'button2',
//           onPressed: () =>
//               deleteMoments(momentsNotifier.currentMoments, _onMomentsDeleted),
//           child: Icon(Icons.delete),
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//         ),
//       ],
//     ),
//   );
// }
