

// Provide cubit to view

//bloc provider

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/presentation/todo_cubit.dart';
import 'package:todo_flutter/presentation/todo_view.dart';
import '../../domain/repository/todo_repo.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );

  }
}
