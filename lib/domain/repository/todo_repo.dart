


import '../models/todo.dart';

/// here we can define what the app can do

abstract class TodoRepo {

  //get list of todo's
  Future<List<Todo>> getTodos();

  //add new todo
  Future<void> addTodo(Todo newTodo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);

}

/**
 * notes:
 * the repo in the domain layer outline what operations the app can do, but doesn't worry
 * about the specific implementation details, that's for the data layer
 *
 * - which means its technology agnostic - its pure dart file
 *
 */