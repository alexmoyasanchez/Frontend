import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedInputField2 extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputField2({
    Key key,
    this.hintText,
    this.onChanged, TextStyle hintStyle, Color fillColor,
  }) : super(key: key);

  @override
  State<RoundedInputField2> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField2> {
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}