import 'package:hive/hive.dart';

part 'note_model_hive.g.dart';
/*
 Debe ser el mismo nombre del archivo con extension .g
 notes.dart - notes.g.dart
*/

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String color;
  @HiveField(3)
  String date;

  Note({this.title, this.description, this.color, this.date});
}
