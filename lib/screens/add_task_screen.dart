import 'package:flutter/material.dart';
import 'package:to_do_flutter/blocs/bloc_exports.dart';
import 'package:to_do_flutter/services/guid_gen.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            'Adicionar tarefa',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Nome'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: titleController.text,
                      id: GUIDGen.generate(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: Text('Adicionar')),
            ],
          ),
        ]),
      ),
    );
  }
}
