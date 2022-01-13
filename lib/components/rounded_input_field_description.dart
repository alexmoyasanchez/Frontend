import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedInputFieldLargo extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldLargo({
    Key key,
    this.hintText,
    this.onChanged, TextStyle hintStyle, Color fillColor,
  }) : super(key: key);

  @override
  State<RoundedInputFieldLargo> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputFieldLargo> {
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
        maxLines: 5,
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