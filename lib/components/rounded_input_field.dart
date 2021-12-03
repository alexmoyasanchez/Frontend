import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged, TextStyle hintStyle, Color fillColor,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController _controller;
  
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Colors.white,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
