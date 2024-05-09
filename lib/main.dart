import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/new_task.dart';
import 'package:flutter_todo_app/screens/search.dart';
import './screens/home.dart';
import './screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List App',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/Home': (context) => Home(),
        '/TaskCreator': (context) => const TaskCreator(),
        '/Search': (context) => const Search(),
      },
    );
  }
}
