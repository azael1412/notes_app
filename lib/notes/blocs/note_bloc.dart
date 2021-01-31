import 'package:flutter/material.dart';

import 'package:notes_app/notes/resources/note_repository.dart';

import 'package:notes_app/notes/models/note_model_hive.dart';

import 'package:hive/hive.dart';

class NoteBloc with ChangeNotifier {
  final _noteRepository = NoteRepository();

  Box<Note> get box => _noteRepository.box;

  Future<bool> initBox() => _noteRepository.initBox();

  Future<bool> addNoteBox({Note note}) =>
      _noteRepository.addNoteBox(note: note);

  Future<bool> createNotesBox({Iterable<Note> iterableNote}) =>
      _noteRepository.createNotesBox(iterableNote: iterableNote);

  Map<dynamic, dynamic> readNotesBox() => _noteRepository?.readNotesBox();

  Future<bool> deleteNotesBox({int index}) =>
      _noteRepository.deleteNotesBox(index: index);

  Future<bool> updateNotesBox({int index, Note note}) =>
      _noteRepository.updateNotesBox(index: index, note: note);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _noteRepository.dispose();
  }
}
