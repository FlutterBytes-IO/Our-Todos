import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_todo/src/views/home_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: OurTodo(),
    ),
  );
}

class OurTodo extends StatelessWidget {
  const OurTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Todos',
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
