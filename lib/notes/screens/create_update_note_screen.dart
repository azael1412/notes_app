import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/note_bloc.dart';
import 'package:notes_app/notes/blocs/theme_bloc.dart';

// import 'package:notes_app/notes/models/note_model.dart';
import 'package:notes_app/notes/models/note_model.dart' as noteModel;
import 'package:notes_app/notes/models/note_model_hive.dart' as noteModelHive;
import 'package:notes_app/widgets/alert.dart';
// import 'package:notes_app/notes/resources/note_provider.dart';

import 'package:notes_app/widgets/color_selection.dart';
import 'package:notes_app/widgets/input_text.dart' as input;
import 'package:notes_app/widgets/navigation_header.dart';
import 'package:notes_app/widgets/snackbar_message.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CreateOrUpdateNoteScreen extends StatefulWidget {
  final noteModel.Note note;
  final Function updateNoteList;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CreateOrUpdateNoteScreen(
      {Key key, this.note, this.updateNoteList, this.scaffoldKey})
      : super(key: key);

  @override
  _CreateOrUpdateNoteScreenState createState() =>
      _CreateOrUpdateNoteScreenState();
}

class _CreateOrUpdateNoteScreenState extends State<CreateOrUpdateNoteScreen> {
  GlobalKey<ScaffoldState> _scaffoldKeyCreateOrUpdate =
      GlobalKey<ScaffoldState>();
  NoteBloc _noteBloc = NoteBloc();
  // NoteProvider _notesBoxProvider = NoteProvider();

  TextEditingController _titleController;
  TextEditingController _descriptionController;
  String color = "#0000FF";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _noteBloc.initBox();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    if (widget.note != null) {
      // print("color: ${widget.note.color}");
      _titleController.text = widget.note.title;
      _descriptionController.text = widget.note.description;
      color = widget.note.color;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _noteBloc.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeBloc>(context, listen: false).isDarkMode;
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        _validationBack();
        return Future.value(false);
      },
      child: Scaffold(
        key: _scaffoldKeyCreateOrUpdate,
        body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 50.0),
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
                        actionLeft: () {
                          _validationBack();
                        },
                        actionRight: () => onSaved(),
                        iconRight: Icons.save_outlined),
                  ),
                ],
              )),
        ),
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
                selected: color,
                onValueChanged: (newColor) {
                  setState(() {});
                  color = newColor;
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

  void onSaved() {
    //quito los espacios en blanco
    _titleController.text = _titleController.text.trim();
    _descriptionController.text = _descriptionController.text.trim();

    final noteHive = noteModelHive.Note(
        title: _titleController.text,
        description: _descriptionController.text,
        color: color,
        date: DateFormat.yMd().format(new DateTime.now()));

    if (_titleController.text.length > 0 &&
        _descriptionController.text.length > 0 &&
        color.length > 0) {
      print(
          'titulo: ${_titleController.text} - descripcion: ${_descriptionController.text} - color: $color');
      String message = '';
      if (widget.note == null) {
        //agrego la nota
        _noteBloc.addNoteBox(note: noteHive);
        //actualizo la lista
        // widget.updateNoteList();
        message = 'Nota Creada';
      } else {
        //actualizo la nota
        _noteBloc.updateNotesBox(index: widget.note.id, note: noteHive);
        //actualizo la lista
        // widget.updateNoteList();
        message = 'Nota Editada';
      }
      //actualizo la lista
      // if (widget.updateNoteList != null) {
      //   widget.updateNoteList();
      // }
      widget.updateNoteList();
      Navigator.pop(_scaffoldKeyCreateOrUpdate.currentContext);
      SnackBarMessage.message(text: message, scaffoldKey: widget.scaffoldKey);
    } else {
      print(
          'titulo: ${_titleController.text} - descripcion: ${_descriptionController.text} - color: $color');
      FocusScope.of(_scaffoldKeyCreateOrUpdate.currentContext)
          .unfocus(); //cerrar teclado
      SnackBarMessage.message(
          text: "Faltan datos", scaffoldKey: _scaffoldKeyCreateOrUpdate);
    }
  }

  void _validationBack() async {
    if (_titleController.text.length > 0 ||
        _descriptionController.text.length > 0 ||
        color.length > 0) {
      final bool result = await Alert.showAlertDialog(
          context: _scaffoldKeyCreateOrUpdate.currentContext);
      if (result) {
        // Navigator.of(widget.scaffoldKey.currentContext).pop();
        Navigator.of(_scaffoldKeyCreateOrUpdate.currentContext).pop();
      }
    } else {
      // Navigator.of(widget.scaffoldKey.currentContext).pop();
      Navigator.of(_scaffoldKeyCreateOrUpdate.currentContext).pop();
    }
  }
}
