

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter/data/repository/isar_todo_repo.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/presentation/todo_cubit.dart';

class MockTodoRepo extends Mock implements IsarTodoRepo {}
class FakeTodo extends Fake implements Todo {}

void main(){

  late TodoCubit todoCubit;
  late MockTodoRepo mockTodoRepo;

  setUpAll((){
    mockTodoRepo = MockTodoRepo();
    registerFallbackValue(FakeTodo());
  });

  group('todo_cubit test', (){

    test('load todos from repo', () async {
      final newTodo = Todo(id: 22, text: 'New Task', isCompleted: true);

      when(() => mockTodoRepo.getTodos())
          .thenAnswer((_) async => [newTodo]);

      todoCubit = TodoCubit(mockTodoRepo);
      await todoCubit.loadTodos();

      expect(todoCubit.state.length, 1);
      expect(todoCubit.state.first.text, 'New Task');

    });

    test('add todo', () async {

      final newTodo = Todo(id: 22, text: 'Nothing', isCompleted: true);

      when(() => mockTodoRepo.getTodos())
          .thenAnswer((_) async => [newTodo]);

      when(() => mockTodoRepo.addTodo(any()))
          .thenAnswer((_) async => Future.value());

      todoCubit = TodoCubit(mockTodoRepo);
      await todoCubit.addTodo('kkk');

      expect(todoCubit.state.length, 1);
      expect(todoCubit.state.first.text, 'Nothing');
    });

    test('add todo', () async {

      final newTodo = Todo(id: 22, text: 'Nothing', isCompleted: true);

      when(() => mockTodoRepo.getTodos())
          .thenAnswer((_) async => [newTodo]);

      when(() => mockTodoRepo.addTodo(any()))
          .thenAnswer((_) async => Future.value());

      todoCubit = TodoCubit(mockTodoRepo);
      await todoCubit.addTodo('kkk');

      expect(todoCubit.state.length, 1);
      expect(todoCubit.state.first.text, 'Nothing');
    });

    test('remove todo', () async {
      final newTodo = Todo(id: 22, text: 'Nothing', isCompleted: true);
      final finalTodo = Todo(id: 2, text: 'Welcome', isCompleted: true);

      when(() => mockTodoRepo.deleteTodo(any()))
          .thenAnswer((_) async => {});

      when(() => mockTodoRepo.getTodos())
          .thenAnswer((_) async => [finalTodo]);

      todoCubit = TodoCubit(mockTodoRepo);
      await todoCubit.deleteTodo(newTodo);

      expect(todoCubit.state.length, 1);
      expect(todoCubit.state.first.id, 2);
    });

    test('test toggle', () async {
      final newTodo = Todo(id: 22, text: 'Hello world', isCompleted: true);
      final toggleTodo = newTodo.toggleCompletion();

      when(() => mockTodoRepo.updateTodo(any()))
          .thenAnswer((_) async => {});

      when(() => mockTodoRepo.getTodos())
          .thenAnswer((_) async => [toggleTodo]);

      todoCubit = TodoCubit(mockTodoRepo);
      await todoCubit.toggleTodo(newTodo);

      expect(todoCubit.state.length, 1);
      expect(todoCubit.state.first.isCompleted, false);
    });

    tearDown(() {
      todoCubit.close();
    });


  });

}