import 'package:flutter/material.dart';

import '../blocs/tasks_bloc/tasks_state.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecyclerBin extends StatelessWidget {
  const RecyclerBin({Key? key}) : super(key: key);
  static const id = 'recycler_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Caixa de Lixeira'), actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ]),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                    label: Text(
                  '${state.removedTasks.length} Tasks',
                )),
              ),
              TaskList(tasksList: state.allTasks)
            ],
          ),
        );
      },
    );
  }
}
