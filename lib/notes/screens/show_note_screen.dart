import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/screens/add_note_screen.dart';

import 'package:notes_app/notes/widgets/data_text.dart';
import 'package:notes_app/notes/widgets/navigation_header.dart';

import 'package:provider/provider.dart';

class ShowNoteScreen extends StatefulWidget {
  const ShowNoteScreen({Key key}) : super(key: key);

  @override
  _ShowNoteScreenState createState() => _ShowNoteScreenState();
}

class _ShowNoteScreenState extends State<ShowNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
            // symmetric(horizontal: 10.0, vertical: 50.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DataText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 20.0),
                  DataText(
                    text: "13-12-2020",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 20.0),
                  DataText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    fontWeight: FontWeight.normal,
                    fontSize: 19.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 45.0,
            width: size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: !currentTheme
                    ? <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7.0,
                            offset: Offset(0.0, 2.0)),
                      ]
                    : []),
            child: NavigationHeader(
                actionLeft: () => Navigator.pop(context),
                actionRight: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddNoteScreen())),
                iconRight: Icons.edit),
          )
        ],
      ),
    ));
  }
}
