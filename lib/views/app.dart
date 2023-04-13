import 'package:flutter/material.dart';
import 'package:task_lisst/views/task-create.dart';
import 'package:task_lisst/views/task-list.dart';
import 'package:task_lisst/views/user-login.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas Ignatioon',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/task-list': (context) => TaskListPage(),
        '/task-create': (context) => TaskCreatePage(),
        '/login': (context) => UserLoginPage(),
      },
      initialRoute: '/task-list',
    );
  }
}