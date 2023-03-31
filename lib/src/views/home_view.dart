import 'package:flutter/material.dart';
import 'package:our_todo/src/controllers/todo_controller.dart';
import 'package:our_todo/src/views/completed_todos_view.dart';
import 'package:our_todo/src/views/ongoing_todos_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<WidgetBuilder> _children = [
    (_) => const OngoingTodosView(),
    (_) => const CompletedTodosView(),
  ];

  int _currentViewIndex = 0;

  void onViewChanged(int newViewIndex) {
    setState(() => _currentViewIndex = newViewIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoController(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Our Todo')),
        body: _children[_currentViewIndex](context),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentViewIndex,
          onDestinationSelected: onViewChanged,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.pending_actions),
              label: 'Ongoing Tasks',
            ),
            NavigationDestination(
              icon: Icon(Icons.task_outlined),
              label: 'Completed Tasks',
            ),
          ],
        ),
      ),
    );
  }
}
