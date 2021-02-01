import 'package:login/models/details.dart';
import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final Details details;
  DetailsTile({this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            //backgroundColor: Colors.brown[details.age],
          ),
          title: Text(details.username),
          subtitle: Text('Status ${details.gender} '),
        ),
      ),
    );
  }
}
