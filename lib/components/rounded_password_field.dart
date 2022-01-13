import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/generated/l10n.dart';

class RoundedPasswordField extends StatefulWidget {
  
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    
    return TextFieldContainer(
      child: TextField(
        obscureText: hiddenText,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: S.current.pass,
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
                hiddenText =! hiddenText;
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
