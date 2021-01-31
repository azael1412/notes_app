import 'package:flutter/material.dart';
import 'package:notes_app/notes/models/note_model.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String slideShow = '/slideShow';
  static const String notes = '/notes';
  static const String createOrUpdateNote = '/createOrUpdateNote';
  static const String showNote = '/showNote';
}

class CreateOrUpdateNoteArguments {
  final Note note;
  final Function updateList;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CreateOrUpdateNoteArguments({this.note, this.updateList, this.scaffoldKey});
}

class ShowNoteArguments {
  final Note note;
  ShowNoteArguments({this.note});
}
