import 'package:flutter/material.dart';
import 'package:flutter_auth/generated/l10n.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press, Color textColor, Color color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? S.current.cuenta : S.current.account,
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? S.current.registrate : S.current.inicia,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
