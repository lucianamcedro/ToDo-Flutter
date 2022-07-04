import 'package:flutter/material.dart';
import 'package:to_do_flutter/screens/tasks_screen.dart';
import 'blocs/bloc_exports.dart';
import 'models/task.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
          task: Task(title: 'Tarefa1'),
        )),
      child: MaterialApp(
        title: 'Flutter Tasks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
