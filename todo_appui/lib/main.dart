import 'package:flutter/material.dart';
import 'package:todo_appui/todo_app_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoAppUI(),
    );
  }
}
