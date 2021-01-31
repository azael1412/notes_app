import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:provider/provider.dart';

class DataText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  const DataText(
      {Key key,
      @required this.text,
      @required this.fontWeight,
      @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          boxShadow: !currentTheme
              ? <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[50],
                      blurRadius: 15.0,
                      offset: Offset(0.0, 7.0))
                ]
              : []),
      child: Text(text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          )),
    );
  }
}
