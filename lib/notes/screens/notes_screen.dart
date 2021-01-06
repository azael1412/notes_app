// import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/screens/add_note_screen.dart';
// import 'package:notes_app/notes/screens/setting_screen.dart';
import 'package:notes_app/notes/widgets/navigation_header.dart';
import 'package:notes_app/notes/widgets/note.dart';
import 'package:notes_app/notes/widgets/float_buttom.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ListNote {
  final String title;
  final String body;
  final String date;
  final Color backgroundColor;
  ListNote({this.title, this.body, this.date, this.backgroundColor});
}

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool isGoingDown = true;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ListNote> _listNotes = [
    ListNote(
        title: "Dart Dart",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.amberAccent),
    ListNote(
        title: "Java java",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.red),
    ListNote(
        title: "ANgular js",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.blue),
    ListNote(
        title: "React Native",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.greenAccent),
    ListNote(
        title: "Jango Python",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(255, 214, 51, 1)),
    ListNote(
        title: "Ruby on Rails",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(78, 51, 255, 1)),
    ListNote(
        title: "Dart Dart",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.amberAccent),
    ListNote(
        title: "Java java",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.red),
    ListNote(
        title: "ANgular js",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.blue),
    ListNote(
        title: "React Native",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.greenAccent),
    ListNote(
        title: "Jango Python",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(255, 214, 51, 1)),
    ListNote(
        title: "Ruby on Rails",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(78, 51, 255, 1)),
    ListNote(
        title: "Dart Dart",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.amberAccent),
    ListNote(
        title: "Java java",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.red),
    ListNote(
        title: "ANgular js",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.blue),
    ListNote(
        title: "React Native",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.greenAccent),
    ListNote(
        title: "Jango Python",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(255, 214, 51, 1)),
    ListNote(
        title: "Ruby on Rails",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(78, 51, 255, 1)),
    ListNote(
        title: "Dart Dart",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.amberAccent),
    ListNote(
        title: "Java java",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.red),
    ListNote(
        title: "ANgular js",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.blue),
    ListNote(
        title: "React Native",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Colors.greenAccent),
    ListNote(
        title: "Jango Python",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(255, 214, 51, 1)),
    ListNote(
        title: "Ruby on Rails",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        date: "06/12/2020",
        backgroundColor: Color.fromRGBO(78, 51, 255, 1))
  ];

  @override
  initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Column(
            children: [
              Container(
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
                child: Consumer<ThemeBloc>(
                  builder: (context, value, child) {
                    return NavigationHeader(
                        actionLeft: () {
                          value.setDarkMode(!value.isDarkMode);
                          final snackBar = SnackBar(
                              elevation: 2.0,
                              duration: Duration(seconds: 2),
                              content: Text(value.isDarkMode
                                  ? 'Modo Oscuro Activado!'
                                  : 'Modo Claro Activado!'));
                          // Find the Scaffold in the widget tree and use it to show a SnackBar.
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        title: "Mis Notas",
                        iconLeft: value.isDarkMode
                            ? Icons.wb_sunny
                            : Icons.brightness_2,
                        actionRight: () => print("action search"),
                        iconRight: Icons.search);
                  },
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                    onNotification: (onScrollNotification) {
                      if (onScrollNotification is ScrollUpdateNotification) {
                        if (onScrollNotification.scrollDelta <= 0.0) {
                          if (!isGoingDown) setState(() => isGoingDown = true);
                          // print("1");
                        } else {
                          if (isGoingDown) setState(() => isGoingDown = false);
                          // print("2");
                        }
                      }
                      return false;
                    },
                    child: _buildList(context)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatButton(isGoingDown, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        }));
  }

  Widget _buildList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StaggeredGridView.countBuilder(
          physics: BouncingScrollPhysics(),
          itemCount: _listNotes.length,
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: new Note(
                  title: _listNotes[index].title,
                  body: _listNotes[index].body,
                  date: _listNotes[index].date,
                  backgroundColor: _listNotes[index].backgroundColor,
                  scaffoldKey: scaffoldKey),
            );
          },
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(index == 2 ? 4 : 2, 2)),
    );
  }
}
