import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final String errorText;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final double fontSize;
  final TextInputType keyboardType;
  final TextEditingController controller;
  // final Function onChange(String);
  const TextInput({
    Key key,
    @required this.minLines,
    @required this.maxLines,
    @required this.maxLength,
    this.fontSize = 18.0,
    this.keyboardType = TextInputType.name,
    @required this.hintText,
    this.errorText,
    @required this.controller,
    // @required  this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(boxShadow: <BoxShadow>[
      //   BoxShadow(
      //       color: Colors.grey[100], blurRadius: 15.0, offset: Offset(0.0, 7.0))
      // ]),
      child: TextField(
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        // onChanged: (value) => this._title = value,
        decoration: InputDecoration(
          // labelText: "Title",
          hintText: hintText,
          errorText: errorText,
          // fillColor: Color(0xFFFFFFFF), //relleno
          // filled: true,
          labelStyle: TextStyle(fontSize: fontSize),
          border: InputBorder.none,
          /* OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),*/
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.transparent,
                // width: 2.0,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.transparent,
                // width: 2.0,
              )),
        ),
      ),
    );
  }
}
