import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/screens/add_note_screen.dart';
import 'package:notes_app/notes/screens/show_note_screen.dart';
import 'package:notes_app/notes/widgets/color_selection.dart';

import 'package:provider/provider.dart';

class Note extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final Color backgroundColor;
  final String title;
  final String body;
  final String date;
  // final BuildContext buildContext;
  Note({
    Key key,
    @required this.title,
    @required this.body,
    @required this.date,
    @required this.backgroundColor,
    this.scaffoldKey,
    // this.buildContext
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    return GestureDetector(
      onTap: () => _modalBbuttomSheet(scaffoldKey: scaffoldKey),
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundColor,
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
              Text(
                title.length <= 41 ? title : "${title.substring(0, 37)}...",
                textAlign: TextAlign.justify,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
              ),
              Text(
                body.length <= 121 ? body : "${body.substring(0, 120)}...",
                textAlign: TextAlign.justify,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.white),
              ),
              Expanded(child: Container()),
              Text(
                date,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }

  void _modalBbuttomSheet({GlobalKey<ScaffoldState> scaffoldKey}) {
    String color = "";
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
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 60.0,
                  // constraints: BoxConstraints(
                  // maxHeight: MediaQuery.of(context).size.height),
                  child: ColorSelection(
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
                        color = newColor;
                        print("valor: $color");
                      }),
                ),
                ListTile(
                  leading: new Icon(Icons.remove_red_eye),
                  title: new Text('Ver'),
                  onTap: () => Navigator.push(
                      scaffoldKey.currentContext,
                      MaterialPageRoute(
                          builder: (context) => ShowNoteScreen())),
                ),
                ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Editar'),
                  onTap: () => Navigator.push(scaffoldKey.currentContext,
                      MaterialPageRoute(builder: (context) => AddNoteScreen())),
                ),
                ListTile(
                  leading: new Icon(Icons.copy),
                  title: new Text('Copiar'),
                  onTap: () => {},
                ),
                ListTile(
                    leading: new Icon(Icons.delete_forever),
                    title: new Text('Eliminar'),
                    onTap: () => {}),
                ListTile(
                  leading: new Icon(Icons.share),
                  title: new Text('Compartir'),
                  onTap: () => {},
                )
              ],
            ),
          );
        });
  }
}
