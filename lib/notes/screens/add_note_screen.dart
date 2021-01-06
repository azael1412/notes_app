import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/widgets/color_selection.dart';
import 'package:notes_app/notes/widgets/input_text.dart' as input;
import 'package:notes_app/notes/widgets/navigation_header.dart';

import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({Key key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  String color;

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
                  child: _formNote(),
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
                      actionRight: () => print("actions..."),
                      iconRight: Icons.save_outlined),
                ),
              ],
            )),
      ),
    );
  }

  Widget _formNote() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            height: 60.0,
            child: ColorSelection(
                colors: {
                  "red": "#FF0000",
                  "green": "#008000",
                  "blue": "#0000FF",
                  // "yellow": "#FFFF00",
                  "purple": "#800080",
                  "teal": "#008080",
                  "orange": "#FFA500",
                  "SaddleBrown": "#8B4513",
                  "gold": "#FFD700",
                  "fuchsia": "#FF00FF",
                  "gray": "#808080",
                },
                onValueChanged: (newColor) {
                  color = newColor;
                  // print("valor: $color");
                }),
          ),
          SizedBox(
            height: 20.0,
          ),
          input.TextInput(
            minLines: 1,
            maxLines: 2,
            maxLength: 80,
            keyboardType: TextInputType.name,
            fontSize: 15.0, //18
            hintText: "Title",
            controller: _titleController,
            // onChanged: (value) => this._title = value,
          ),
          SizedBox(height: 10.0),
          input.TextInput(
            minLines: 20,
            maxLines: 30,
            maxLength: 1000,
            keyboardType: TextInputType.multiline,
            fontSize: 15.0, //18
            hintText: "Description",
            controller: _descriptionController,
            // onChanged: (value) => this._title = value,
          ),
        ],
      ),
    );
  }
}
