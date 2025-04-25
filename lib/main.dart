import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_flutter/data/models/isar_todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/todo_page.dart';

import 'data/repository/isar_todo_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get directory path of db
  final dir = await getApplicationDocumentsDirectory();
  //open isar db
  final isar = await Isar.open([TodoIsarSchema],directory: dir.path);

  //initialize repo
  final isarTodoRepo = IsarTodoRepo(isar);


  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  //inject db through the app
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );


  }
}

