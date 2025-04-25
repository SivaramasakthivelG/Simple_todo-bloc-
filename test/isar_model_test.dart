import 'package:flutter_test/flutter_test.dart';
import 'package:todo_flutter/data/models/isar_todo.dart';
import 'package:todo_flutter/domain/models/todo.dart';

void main() {

  group('Todo Isar mapping test', () {
    test('TodoIsar to Todo',() {

      final todoIsar = TodoIsar()
        ..id = 1
        ..text = 'Test task'
        ..isCompleted = true;

      //Isar to todo
      final todo = todoIsar.toDomain();


      expect(todo.id, 1);
      expect(todo.text, "Test task");
      expect(todo.isCompleted, true);

    });

    test('Todo to TodoIsar', () {

      //create todo object

      final todo = Todo(id: 33, text: "work hard",isCompleted: true);

      final isar = TodoIsar.fromDomain(todo);

      expect(isar.id, 33);
      expect(isar.text, "work hard");
      expect(isar.isCompleted, true);

    });

  });

}