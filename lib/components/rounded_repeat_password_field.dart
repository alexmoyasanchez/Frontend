import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedRepeatPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedRepeatPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedRepeatPasswordField> createState() =>
      _RoundedRepeatPasswordFieldState();
}

class _RoundedRepeatPasswordFieldState
    extends State<RoundedRepeatPasswordField> {
  bool hiddenText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: hiddenText,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Repetir Contraseña",
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          icon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: Colors.white,
            onPressed: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            }
          ),
        ),
      ),
    );
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
