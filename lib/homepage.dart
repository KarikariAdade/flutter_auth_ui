import 'package:flutter/material.dart';
import 'package:ui_login/services/auth.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('you are logged in'),
          RaisedButton(
            onPressed: (){
              Auth().signOut();
            },
            child: Center(
              child: Text('Log Out'),
            ),
          )
        ],
      ),
    );
  }
}
