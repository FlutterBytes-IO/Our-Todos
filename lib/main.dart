import 'package:flutter/material.dart';

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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
