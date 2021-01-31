import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

// import 'package:notes_app/notes/screens/create_update_note_screen.dart';
import 'package:notes_app/notes/models/note_model.dart' as noteModel;
// import 'package:notes_app/routes/app_routes.dart';

import 'package:notes_app/widgets/data_text.dart';
import 'package:notes_app/widgets/navigation_header.dart';

import 'package:provider/provider.dart';

class ShowNoteScreen extends StatelessWidget {
  final noteModel.Note note;
  final GlobalKey<ScaffoldState> scaffoldKeyShow = GlobalKey<ScaffoldState>();
  ShowNoteScreen({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKeyShow,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
                // symmetric(horizontal: 10.0, vertical: 50.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DataText(
                        text: note.title,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 20.0),
                      DataText(
                        text: note.date,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 20.0),
                      DataText(
                        text: note.description,
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
                  // actionRight: () => Navigator.pushNamed(
                  //     context, AppRoutes.createOrUpdateNote,
                  //     arguments: CreateOrUpdateNoteArguments(
                  //         note: note, scaffoldKey: scaffoldKeyShow)
                  //         ),
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CreateOrUpdateNoteScreen(
                  //               note: note,
                  //               scaffoldKey: scaffoldKeyShow,
                  //             ))),
                  // iconRight: Icons.edit
                ),
              )
            ],
          ),
        ));
  }
}
