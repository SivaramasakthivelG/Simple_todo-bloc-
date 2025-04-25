// This is for our state management of UI

//Each cubit is a list of todo's

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {

  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //load
  Future<void> loadTodos() async {
    final todos = await todoRepo.getTodos();
    emit(todos);
  }

  //add
  Future<void> addTodo(String text) async {
   final newTodo = Todo(id: DateTime.now().millisecond, text: text);
   await todoRepo.addTodo(newTodo);
   loadTodos();
  }

  //delete
  Future<void> deleteTodo(Todo todo) async {
    await todoRepo.deleteTodo(todo);
    loadTodos();
  }


  //toggle
  Future<void> toggleTodo(Todo todo) async {
    //handles completion state
    final updateTodo = todo.toggleCompletion();
    //update completion to repo
    await todoRepo.updateTodo(updateTodo);
    //reload
    loadTodos();
  }

}