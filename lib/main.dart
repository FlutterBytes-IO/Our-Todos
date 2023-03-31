import 'package:flutter/material.dart';
import 'package:our_todo/src/views/home_view.dart';

void main() {
  runApp(const OurTodo());
}

class OurTodo extends StatelessWidget {
  const OurTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Todo',
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
