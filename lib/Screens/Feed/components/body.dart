import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "FEED",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.pink[800]),
            ),
          ]
        ),
      ),
    );
  }
}
