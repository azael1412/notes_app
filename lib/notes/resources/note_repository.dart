import 'package:notes_app/notes/resources/note_provider.dart';

import 'package:notes_app/notes/models/note_model_hive.dart';

import 'package:hive/hive.dart';

class NoteRepository {
  final noteProvider = NoteProvider();

  Box<Note> get box => noteProvider.box;

  Future<bool> initBox() => noteProvider.initBox();

  Future<bool> addNoteBox({Note note}) => noteProvider.addNoteBox(note: note);

  Future<bool> createNotesBox({Iterable<Note> iterableNote}) =>
      noteProvider.createNotesBox(iterableNote: iterableNote);

  Map<dynamic, dynamic> readNotesBox() => noteProvider.readNotesBox();

  Future<bool> deleteNotesBox({int index}) =>
      noteProvider.deleteNotesBox(index: index);

  Future<bool> updateNotesBox({int index, Note note}) =>
      noteProvider.updateNotesBox(index: index, note: note);

  Future<void> dispose() => noteProvider.dispose();
}
