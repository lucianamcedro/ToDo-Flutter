import 'package:flutter/material.dart';
import 'package:to_do_flutter/screens/recycler_bin.dart';
import 'package:to_do_flutter/screens/tasks_screen.dart';

import '../blocs/bloc/tasks_state.dart';
import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            color: Colors.grey,
            child: Text(
              'Menu de Tarefas',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  TaskScreen.id,
                ),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('Minhas Tarefas'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  RecyclerBin.id,
                ),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: const Text('Lixeira'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
