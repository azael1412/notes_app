import 'package:notes_app/notes/models/note_model_hive.dart';

import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';

class NoteProvider {
  Box<Note> _box;
  // List _notes = <Notes>[];
  // Future<List<Notes>> getNotes() async {
  //   _notes = _box.values.toList();
  //   notifyListeners();
  // }

  // List<Notes> get notes => _notes;
  Box<Note> get box => _box;

  Future<bool> initBox() async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path); //Ruta segura dentro de móvil
    _box = await Hive.openBox<Note>(
        'notesBox'); //establece nombre para box en hive
    return true;
  }

  Future<bool> addNoteBox({Note note}) async {
    await _box.add(note); //Agrega con llave int incremental automatico
    return true;
  }

  Future<bool> createNotesBox({Iterable<Note> iterableNote}) async {
    await _box.addAll(
        iterableNote); //Se pasa un iterable que contiene n variables a almacenar
    return true;
  }

  Map<dynamic, dynamic> readNotesBox() {
    Map<dynamic, dynamic> notesBoxMap =
        _box?.toMap(); //Para mejor control, se retorna un mapa
    return notesBoxMap;
  }

  Future<bool> deleteNotesBox({int index}) async {
    await _box.deleteAt(index);
    return true;
  }

  Future<bool> updateNotesBox({int index, Note note}) async {
    await _box.putAt(index, note);
    return true;
  }

  Future<void> dispose() async {
    await box?.compact();
    await _box.close();
  }
}
