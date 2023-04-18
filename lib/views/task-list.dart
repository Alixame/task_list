import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_lisst/models/Task.dart';
import 'package:intl/intl.dart';

class TaskListPage extends StatefulWidget {
  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void handleViewCreate(context) {
    Navigator.pushNamed(context, '/task-create').then((task) {
      if (task is Task) {
        firestore.collection('tasks').add({
          'name': task.name,
          'priority': task.priority,
          'date': task.date,
          'finished': task.finished
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
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firestore.collection('tasks').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator()
                );
              }

              var tasks = snapshot.data!.docs;
              
              return ListView(
                children: tasks.map((task) {
                  var data = task.data();
                  var taskModel = Task(
                    data['name'],
                    data['priority'],
                    data['date'].toDate(),
                    data['finished']
                  );

                  return Card(
                    child: ListTile(
                      title: Text(taskModel.name),
                      subtitle: Text(taskModel.priority),
                      trailing: Text(DateFormat('dd/MM/yyyy').format(taskModel.date)),
                      leading: Checkbox(
                        value: taskModel.finished,
                        onChanged: (value) {
                          firestore.collection('tasks').doc(task.id).update({
                            'finished': value
                          });
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => handleViewCreate(context),
          child: const Icon(Icons.add),
        ));
  }
}
