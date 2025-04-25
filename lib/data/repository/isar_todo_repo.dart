
import 'package:isar/isar.dart';
import 'package:todo_flutter/data/models/isar_todo.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';

/// this class handles the  implementation in the isar db


class IsarTodoRepo implements TodoRepo {

  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<void> addTodo(Todo newTodo) {
    //convert add todo into isar todo
    final isarTodo = TodoIsar.fromDomain(newTodo);
    //so that we can store it in isardb
    return db.writeTxn(() => db.todoIsars.put(isarTodo));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
      await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<List<Todo>> getTodos() async{
    /// fetch from db and give to domain layer
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) async{
    //convert add todo into isar todo
    final isarTodo = TodoIsar.fromDomain(todo);
    //so that we can update it in isar db
    return db.writeTxn(() => db.todoIsars.put(isarTodo));
  }

}