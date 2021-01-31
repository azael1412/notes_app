// import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/button_bloc.dart';
import 'package:notes_app/notes/blocs/note_bloc.dart';
import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/models/note_model.dart' as notemodel;
// import 'package:notes_app/notes/resources/note_provider.dart';

// import 'package:notes_app/notes/screens/create_update_note_screen.dart';
import 'package:notes_app/routes/app_routes.dart';
// import 'package:notes_app/notes/screens/setting_screen.dart';
import 'package:notes_app/widgets/navigation_header.dart';
import 'package:notes_app/widgets/note.dart' as noteWidget;
import 'package:notes_app/widgets/float_button.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

// class ListNote {
//   final String title;
//   final String body;
//   final String date;
//   final Color backgroundColor;
//   ListNote({this.title, this.body, this.date, this.backgroundColor});
// }

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => ButtonBloc(), child: Notes());
  }
}

class Notes extends StatefulWidget {
  Notes({Key key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  NoteBloc _noteBloc = NoteBloc();
  // bool isGoingDown = true;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollController;

  Map<dynamic, dynamic> _notesBoxMap;

  @override
  initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _noteBloc.initBox();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels <= 0.0) {
        Provider.of<ButtonBloc>(context, listen: false).show = true;
      } else {
        Provider.of<ButtonBloc>(context, listen: false).show = false;
      }
    });
    _updateNoteList();
    // print("entre");
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
    _noteBloc.dispose();
    _scrollController.dispose();
  }

  _updateNoteList() {
    setState(() {
      _notesBoxMap = _noteBloc.readNotesBox();
    });
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
                        actionLeft: () => value.setDarkMode(!value.isDarkMode),
                        // final snackBar = SnackBar(
                        //     elevation: 2.0,
                        //     duration: Duration(seconds: 2),
                        //     content: Text(value.isDarkMode
                        //         ? 'Modo Oscuro Activado!'
                        //         : 'Modo Claro Activado!'));
                        // Scaffold.of(context).showSnackBar(snackBar);
                        // },
                        title: "Mis Notas",
                        iconLeft: value.isDarkMode
                            ? Icons.wb_sunny
                            : Icons.brightness_2,
                        actionRight: () => print("action search"),
                        iconRight: Icons.search);
                  },
                ),
              ),
              ChangeNotifierProvider(
                  create: (_) => ButtonBloc(), child: _buildList())
              // _buildList(),
            ],
          ),
        ),
        floatingActionButton: FloatButton(() {
          Navigator.pushNamed(context, AppRoutes.createOrUpdateNote,
              arguments: CreateOrUpdateNoteArguments(
                  note: null,
                  updateList: _updateNoteList,
                  scaffoldKey: scaffoldKey));
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => CreateOrUpdateNoteScreen(
          //             updateNoteList: _updateNoteList,
          //             scaffoldKey: scaffoldKey,
          //           )),
          // );
        }));
  }

  Widget _allNotes() {
    _notesBoxMap = _noteBloc.readNotesBox();
    var keysNotesBoxDB = _notesBoxMap?.keys;
    if (_noteBloc.box.length > 0) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              itemCount: _notesBoxMap?.length,
              controller: _scrollController,
              crossAxisCount: 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              itemBuilder: (context, index) {
                var keynoteBox = keysNotesBoxDB.elementAt(index);
                var notesBox = _notesBoxMap[keynoteBox];
                final note = notemodel.Note(
                    id: index,
                    title: notesBox.title,
                    description: notesBox.description,
                    date: notesBox.date,
                    color: notesBox.color);
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new noteWidget.Note(
                    noteModel: note,
                    // index: index,
                    // title: notesBox.title,
                    // description: notesBox.description,
                    // date: notesBox.date ?? '07-01-2021',
                    // backgroundColor:
                    //     notesBox.color == null ? "#FFD700" : notesBox.color,
                    scaffoldKey: scaffoldKey,
                    updateNoteList: _updateNoteList,
                  ),
                );
              },
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(index == 2 ? 4 : 2, 2)),
        ),
      );
    } else {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/no_data.png'),
            SizedBox(height: 80),
            Text(
              "Agrega una nota para comenzar",
              style: Theme.of(scaffoldKey.currentContext).textTheme.caption,
            )
          ],
        ),
      );
      // return Center(child: Text("No hay datos"));
    }
  }

  _buildList() {
    // return Container();
    return FutureBuilder(
      future: _noteBloc.initBox(),
      builder: (context, snapshot) {
        /*switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return _allNotes();
          case ConnectionState.done:
            return _allNotes();
          default:
            Container();
        }*/
        if (snapshot.hasData) {
          return _allNotes();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
