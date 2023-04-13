import 'package:flutter/material.dart';
import 'package:task_lisst/models/Task.dart';

class TaskListPage extends StatefulWidget {
  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [Task('Tarefa 1', 'Alta'), Task('Tarefa 2', 'Baixa')];

  void handleViewCreate(context) {
    Navigator.pushNamed(context, '/task-create').then((task) {
      if (task is Task) {
        setState(() {
          tasks.add(task);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas Ignatioon'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].priorit),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => handleViewCreate(context),
          child: const Icon(Icons.add),
        ));
  }
}
