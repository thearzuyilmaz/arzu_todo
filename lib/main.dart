import 'package:flutter/material.dart';
import 'package:arzu_todo/screens/TodoListScreen.dart';
import 'package:provider/provider.dart';
import 'package:arzu_todo/models/TaskData.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => TaskData(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}
