/*
ISAR todo model
convert todo model into isar todo model hat we can store in our isar db
*/

import 'package:isar/isar.dart';
import 'package:todo_flutter/domain/models/todo.dart';

//to generate isar todo object, run: dart run build runner
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //convert isar object -> pure todo object
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  //converting todo object -> isar object
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
