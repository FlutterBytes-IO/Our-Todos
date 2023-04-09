import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_todo/src/views/completed_todos_view.dart';
import 'package:our_todo/src/views/ongoing_todos_view.dart';
import 'package:our_todo/src/widgets/add_todo_button.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final _children = const <Widget>[
    OngoingTodosView(),
    CompletedTodosView(),
  ];

  int _currentViewIndex = 0;

  void onViewChanged(int newViewIndex) {
    setState(() => _currentViewIndex = newViewIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Todo')),
      body: _children[_currentViewIndex],
      floatingActionButton: const AddTodoButton(),
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
    );
  }
}
