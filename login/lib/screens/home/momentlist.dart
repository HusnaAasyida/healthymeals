import 'package:login/api/moments_api.dart';
import 'package:login/notifier/moments_notifier.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/momentdetails.dart';
import 'package:login/screens/home/moments_form.dart';
import 'package:login/services/auth.dart';
import 'package:provider/provider.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    MomentsNotifier momentsNotifier =
        Provider.of<MomentsNotifier>(context, listen: false);
    getMoments(momentsNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    MomentsNotifier momentsNotifier = Provider.of<MomentsNotifier>(context);

    Future<void> _refreshList() async {
      getMoments(momentsNotifier);
    }

    print("building Moments");
    return Scaffold(
      appBar: AppBar(
        title: Text("List Story"),
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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // leading: Image.network(
            //   momentsNotifier.momentsList[index].image,
            //   width: 120,
            //   fit: BoxFit.fitWidth,
            // ),
            title: Text(momentsNotifier.momentsList[index].name),
            subtitle: Text(momentsNotifier.momentsList[index].category),
            onTap: () {
              momentsNotifier.currentMoments =
                  momentsNotifier.momentsList[index];
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return MomentsDetail();
              }));
            },
          );
        },
        itemCount: momentsNotifier.momentsList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          momentsNotifier.currentMoments = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MomentsForm(
                isUpdating: false,
              );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[300],
      ),
    );
  }
}

//
//           momentsNotifier.momentsList[index].image != null
//               ? momentsNotifier.momentsList[index].image
//               : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//
//         ),
