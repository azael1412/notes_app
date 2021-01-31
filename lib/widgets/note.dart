import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/note_bloc.dart';
import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/models/note_model.dart' as notemodel;
// import 'package:notes_app/notes/models/note_model_hive.dart' as noteModelHive;
// import 'package:notes_app/notes/models/note_model_hive.dart' as noteModel;
// import 'package:notes_app/notes/resources/note_provider.dart';

import 'package:notes_app/notes/screens/create_update_note_screen.dart';
import 'package:notes_app/notes/screens/show_note_screen.dart';
import 'package:notes_app/routes/app_routes.dart';
import 'package:notes_app/widgets/alert.dart';

// import 'package:notes_app/notes/widgets/color_selection.dart';
import 'package:notes_app/widgets/snackbar_message.dart';

import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'package:intl/intl.dart';
import 'package:clipboard/clipboard.dart';

class Note extends StatelessWidget {
  final notemodel.Note noteModel;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function updateNoteList;
  // final NoteProvider _noteBloc = NoteProvider();
  final NoteBloc _noteBloc = NoteBloc();
  // final BuildContext buildContext;
  Note({
    Key key,
    @required this.noteModel,
    @required this.scaffoldKey,
    @required this.updateNoteList,
    // this.buildContext
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _noteBloc.initBox();
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    String auxColor = noteModel.color.replaceAll('#', '0xff');
    int hexColor = int.parse(auxColor);

    return GestureDetector(
      onTap: () => _modalBbuttomSheet(scaffoldKey: scaffoldKey),
      behavior: HitTestBehavior.translucent,
      child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(hexColor),
              boxShadow: !currentTheme
                  ? <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          offset: Offset(1.0, 6.0)),
                    ]
                  : []),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                noteModel.title,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
                minFontSize: 14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // Text(
              //   title.length <= 41 ? title : "${title.substring(0, 37)}...",
              //   textAlign: TextAlign.justify,
              //   overflow: TextOverflow.fade,
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18.0,
              //       color: Colors.white),
              // ),
              SizedBox(height: 10.0),
              AutoSizeText(
                noteModel.description,
                style: TextStyle(
                    // fontSize: 40,
                    // fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
                minFontSize: 14,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              // Text(
              //   description.length <= 121
              //       ? description
              //       : "${description.substring(0, 120)}...",
              //   textAlign: TextAlign.justify,
              //   overflow: TextOverflow.fade,
              //   style: TextStyle(
              //       fontWeight: FontWeight.normal, color: Colors.white),
              // ),
              Expanded(child: Container()),
              // SizedBox(height: 10.0),
              AutoSizeText(
                noteModel.date,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
                minFontSize: 14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // Text(
              //   date,
              //   textAlign: TextAlign.right,
              //   style: TextStyle(color: Colors.white),
              // ),
            ],
          )),
    );
  }

  void _modalBbuttomSheet({GlobalKey<ScaffoldState> scaffoldKey}) {
    // String color = "#0000FF";
    showModalBottomSheet(
        context: scaffoldKey.currentContext,
        elevation: 1.0,
        backgroundColor: Colors.transparent,
        isDismissible: true, //poner una x para cerrar el modal
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color:
                  Theme.of(scaffoldKey.currentContext).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            // BorderRadius.only(
            //     bottomLeft: Radius.circular(16.0),
            //     bottomRight: Radius.circular(16.0))),
            child: Wrap(
              children: [
                /*Container(
                  padding: EdgeInsets.all(10.0),
                  height: 60.0,
                  // constraints: BoxConstraints(
                  // maxHeight: MediaQuery.of(context).size.height),
                  child: ColorSelection(
                      selected: color,
                      top: 8.0,
                      right: 12.0,
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
                        // setstates
                        color = newColor;
                        print("hola jeje $color");
                        // noteModel.color = color;
                        // final noteHive = noteModelHive.Note(
                        //     title: noteModel.title,
                        //     description: noteModel.description,
                        //     color: noteModel.color,
                        //     date: DateFormat.yMd().format(new DateTime.now()));

                        // _noteBloc.updateNotesBox(
                        //     index: noteModel.id, note: noteHive);
                        //actualizo la lista
                        // widget.updateNoteList();
                        // message = 'Nota Editada';
                        // print("valor: $newColor");
                        // print("valor: $color");
                      }),
                ),*/
                ListTile(
                    leading: new Icon(Icons.remove_red_eye),
                    title: new Text('Ver'),
                    onTap: () => Navigator.pushNamed(
                        scaffoldKey.currentContext, AppRoutes.showNote,
                        arguments: ShowNoteArguments(note: noteModel))
                    // Navigator.push(
                    //     scaffoldKey.currentContext,
                    //     MaterialPageRoute(
                    //         builder: (context) => ShowNoteScreen(
                    //               note: noteModel,
                    //             ))),
                    ),
                ListTile(
                    leading: new Icon(Icons.edit),
                    title: new Text('Editar'),
                    onTap: () => Navigator.pushNamed(scaffoldKey.currentContext,
                        AppRoutes.createOrUpdateNote,
                        arguments: CreateOrUpdateNoteArguments(
                            note: noteModel,
                            updateList: updateNoteList,
                            scaffoldKey: scaffoldKey))
                    // Navigator.push(scaffoldKey.currentContext,
                    //     MaterialPageRoute(builder: (context) {
                    //   // final noteModelHive = noteModel.Note(
                    //   //     title: title,
                    //   //     description: description,
                    //   //     color: backgroundColor,
                    //   //     date: date);
                    //   return CreateOrUpdateNoteScreen(
                    //       note: noteModel,
                    //       updateNoteList: updateNoteList,
                    //       scaffoldKey: scaffoldKey);
                    // })),
                    ),
                ListTile(
                  leading: new Icon(Icons.copy),
                  title: new Text('Copiar'),
                  onTap: () {
                    FlutterClipboard.copy(noteModel.description)
                        .then((value) => print('copied'));
                    SnackBarMessage.message(
                        text: "Nota Copiada", scaffoldKey: scaffoldKey);
                    Navigator.of(scaffoldKey.currentContext).pop();
                  },
                ),
                ListTile(
                    leading: new Icon(Icons.delete_forever),
                    title: new Text('Eliminar'),
                    onTap: () async {
                      print("id+ ${noteModel.id}");
                      final bool result = await Alert.showAlertDialog(
                          context: scaffoldKey.currentContext,
                          text: '¿Esta seguro de eliminar la nota?');
                      if (result) {
                        _noteBloc.deleteNotesBox(index: noteModel.id);
                        updateNoteList();
                        SnackBarMessage.message(
                            text: "Nota Eliminada", scaffoldKey: scaffoldKey);
                        Navigator.of(scaffoldKey.currentContext).pop();
                      } else {
                        Navigator.of(scaffoldKey.currentContext).pop();
                      }
                    }),
                ListTile(
                  leading: new Icon(Icons.share),
                  title: new Text('Compartir'),
                  onTap: () async {
                    await Share.share('${noteModel.description}',
                        subject: '${noteModel.title}');
                  },
                )
              ],
            ),
          );
        });
  }
}
